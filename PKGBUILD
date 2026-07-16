# Maintainer: Sam M <contact@s-mc.io>
pkgname=nuvio-desktop
_pkgname=nuvio
pkgver=0.1.12_alpha # Set this to the target release tag (using _ instead of -)
pkgrel=1
pkgdesc="A modern media hub desktop application"
arch=('x86_64')
url="https://github.com/NuvioMedia/NuvioDesktop"
license=("GPL-3.0-or-later")
depends=('java-runtime>=17' 'mpv')
makedepends=('git' 'java-environment>=17' 'patchelf' 'pkgconf')
provides=("${pkgname}")
conflicts=("${pkgname}")

# Maps pkgver to git tag format (e.g., 0.1.12_alpha -> 0.1.12-alpha)
_git_tag="${pkgver//_/-}"
source=("${pkgname}::git+${url}.git#tag=${_git_tag}")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"

	# 1. Create a dummy local.properties file to satisfy the Gradle task input validator
	touch local.properties

	# 2. De-duplicate XML keys in the Italian translation file (if still present in tag release)
	_it_strings="composeApp/src/commonMain/composeResources/values-it/strings.xml"
	if [ -f "${_it_strings}" ]; then
		echo "De-duplicating XML keys in values-it/strings.xml..."
		awk '
      match($0, /name="([^"]+)"/, arr) {
        key = arr[1]
        if (seen[key]++) {
          next
        }
      }
      { print }
    ' "${_it_strings}" >"${_it_strings}.tmp" && mv "${_it_strings}.tmp" "${_it_strings}"
	fi
}

build() {
	cd "${srcdir}/${pkgname}"

	# Run the task to compile the raw optimized distribution directory (bypassing jpackage)
	./gradlew :composeApp:createReleaseDistributable --no-configuration-cache

	# Bundle the player bridge if compiled, and patch its RPATH
	_app_dir="composeApp/build/compose/binaries/main-release/app/Nuvio"
	_player_bridge="composeApp/build/native/linux/libplayer_bridge.so"

	if [ -f "${_player_bridge}" ]; then
		cp "${_player_bridge}" "${_app_dir}/lib/"
		patchelf --set-rpath '$ORIGIN' "${_app_dir}/lib/libplayer_bridge.so"
	fi
}

package() {
	cd "${srcdir}/${pkgname}"
	_app_dir="composeApp/build/compose/binaries/main-release/app/Nuvio"

	# 1. Install compiled application structure into /opt/nuvio
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -Rp "${_app_dir}/." "${pkgdir}/opt/${_pkgname}/"

	# 2. Setup the launch binary wrapper in /usr/bin
	install -d "${pkgdir}/usr/bin"
	cat <<'EOF' >"${pkgdir}/usr/bin/nuvio"
#!/bin/sh
export LD_LIBRARY_PATH="/opt/nuvio/lib:/opt/nuvio/lib/runtime/lib:${LD_LIBRARY_PATH}"
exec "/opt/nuvio/bin/Nuvio" "$@"
EOF
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"

	# 3. Create and install the Desktop Entry directly
	install -d "${pkgdir}/usr/share/applications"
	cat <<EOF >"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=Nuvio
Comment=${pkgdesc}
Exec=${_pkgname}
Icon=${_pkgname}
Type=Application
Categories=AudioVideo;Player;
Terminal=false
EOF

	# 4. Grab the Icon file from the official source tree
	_icon_src="composeApp/src/desktopMain/resources/icons/nuvio-app-icon.png"
	if [ -f "${_icon_src}" ]; then
		install -Dm644 "${_icon_src}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
	fi
}
