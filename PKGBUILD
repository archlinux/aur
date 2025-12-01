# Maintainer: AstroSteveo <stevengmjr at gmail dot com>

pkgname=cursor-appimage
pkgver=0.47.9
pkgrel=1
pkgdesc="Cursor App - AI-first coding environment with auto-updates, stability patches and AppImage packaging"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'curl')
makedepends=('jq')
provides=('cursor')
conflicts=('cursor-bin' 'cursor-bin-patched' 'cursor-extracted' 'cursor-electron')
options=(!strip)

_pkgver() {
	# Get the latest version information from API
	if command -v curl >/dev/null 2>&1 && command -v jq >/dev/null 2>&1; then
		local api_response=$(curl -s "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=latest")
		if [ $? -eq 0 ] && [ -n "$api_response" ]; then
			local version=$(echo "$api_response" | jq -r '.version')
			local url=$(echo "$api_response" | jq -r '.downloadUrl')
			local hash_id=$(echo "$url" | cut -d '/' -f 5)

			if [ -n "$version" ] && [ -n "$hash_id" ]; then
				echo "${version} ${hash_id}"
				return 0
			fi
		fi
	fi
}

_get_info() {
	read -r pkgver hashid <<<"$(_pkgver)"
	echo "pkgver=${pkgver}"
	echo "hashid=${hashid}"
}

eval "$(_get_info)"

source_x86_64=("https://downloads.cursor.com/production/${hashid}/linux/x64/Cursor-${pkgver}-x86_64.AppImage")
noextract=("$(basename "${source_x86_64[0]}")")

# Generate SHA512 checksum dynamically or use SKIP
sha512sums_x86_64=('SKIP')

package() {
	mkdir -p "${pkgdir}/opt/"
	install -Dm755 "${srcdir}/$(basename ${source_x86_64[0]})" "${pkgdir}/opt/tmp.AppImage"

	# Extract the AppImage
	cd "${pkgdir}/opt"
	"${pkgdir}/opt/tmp.AppImage" --appimage-extract >/dev/null || exit 1
	rm "${pkgdir}/opt/tmp.AppImage"

	# Find and fix main.js files with a summary at the end
	found_minheight=0

	while read -r file; do
		if grep -q ",minHeight" "$file"; then
			echo "Applying titlebar fix at ${file}"
			sed -i 's/,minHeight/,frame:false,minHeight/g' "$file"
			found_minheight=1
		fi
	done < <(find squashfs-root/ -type f -name 'main.js')

	# Check if we found and fixed any files
	if [ "$found_minheight" -eq 0 ]; then
		echo "minHeight not found, skipping titlebar fix"
	fi
	mv squashfs-root cursor
	chmod -R a+rX cursor

	# Create bin launcher
	install -Dm755 /dev/null "${pkgdir}/usr/bin/cursor"
	echo "Applying fix for trace trap (core dumped)"
	cat <<SCRIPT >"${pkgdir}/usr/bin/cursor"
#!/bin/bash
XDG_CONFIG_HOME=\${XDG_CONFIG_HOME:-~/.config}

# Environment fix that prevents crashes
export XDG_DATA_DIRS="/usr/share:/usr/local/share"

# Add stability flags by default
DEFAULT_FLAGS="--no-sandbox"

# Allow users to override command-line options
[[ -f "\$XDG_CONFIG_HOME/cursor-flags.conf" ]] && \
   CURSOR_USER_FLAGS="\$(sed 's/#.*//' "\$XDG_CONFIG_HOME/cursor-flags.conf" | tr '\n' ' ')"

# Launch with both default and user flags
exec /opt/cursor/AppRun \$DEFAULT_FLAGS "\$@" \$CURSOR_USER_FLAGS
SCRIPT

	# Install icon and desktop file
	install -Dm644 "cursor/code.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cursor.png"
	install -Dm644 /dev/null "${pkgdir}/usr/share/applications/cursor.desktop"
	cat <<DESKTOP >"${pkgdir}/usr/share/applications/cursor.desktop"
[Desktop Entry]
Name=Cursor
Comment=AI-first code editor - What will you create today?
Exec=/usr/bin/cursor %U
Terminal=false
Type=Application
Icon=cursor
StartupWMClass=Cursor
MimeType=text/plain;text/x-js;text/javascript;text/x-python;text/x-c;text/x-java;
Categories=Development;IDE;
DESKTOP
}

post_install() {
	echo "================================================================"
	echo "Cursor has been installed with stability patches and titlebar fix."
	echo "Custom flags can be added to: ~/.config/cursor-flags.conf"
	echo "Current version: ${pkgver}"
	echo "================================================================"
	update-desktop-database -q
}
