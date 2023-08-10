# Maintainer: copygirl <copygirl@mcft.net>
pkgname=vintagestory

# _release is the version's release type, commonly "stable" for normal releases,
# "unstable" for release candidates and "pre" for testing releases before big updates.
_release=stable
# _pkgver is separate to allow specifying pre-release versions such as "-rc.1".
_pkgver=1.18.8

# makepkg doesn't support hyphens in pkgver. They'll be replaced with underscores.
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Uncompromising wilderness survival sandbox game (requires paid account)"
arch=("any")
url="https://www.vintagestory.at/"
license=("custom")
depends=("dotnet-runtime" "opengl-driver" "openal")
source=("https://cdn.vintagestory.at/gamefiles/$_release/vs_client_linux-x64_$_pkgver.tar.gz"
#       "https://account.vintagestory.at/files/$_release/vs_client_linux-x64_$_pkgver.tar.gz" (alternative source)
        "vintagestory.desktop")
md5sums=("40e307ae1c0ebe6db1a95c375fb41ffc"
         "26ff9ca4fb0a583589f26f2c274d4ec6")

prepare() {
	# Remove install script provided by developers
	rm "$pkgname"/install.sh
	# Fix file permissions so other users can access them
	find "$pkgname" -type f -exec chmod 644 {} \;
	# Mark .sh files and executables as executable
	chmod +x "$pkgname"/*.sh "$pkgname"/Vintagestory "$pkgname"/VintagestoryServer
	# Create symbolic links for any assets (excluding fonts) containing non-lowercase letters
	# Some asset files might include uppercase letters, but the game expects them to be all-lowercase
	find "$pkgname"/assets/ -not -path "*/fonts/*" -regex ".*/.*[A-Z].*" | while read -r file; do
		local filename="$(basename -- "$file")"
		ln -sf "$filename" "${file%/*}"/"${filename,,}"
	done
}

package() {
	# Copy application icon and .desktop launcher file
	install -Dm644 "$pkgname"/assets/gameicon.xpm "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm
	install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
	# Copy fonts to /usr/share/fonts
	install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF/ "$pkgname"/assets/game/fonts/*.ttf
	# Copy all other application files
	cp -rdp --no-preserve=ownership "$pkgname" "$pkgdir"/usr/share/"$pkgname"
	# Create a symlink to run the game from terminal
	install -dm 755 "${pkgdir}/usr/bin/" # Create directory first (required)
	ln -s "/usr/share/${pkgname}/Vintagestory" "${pkgdir}/usr/bin/${pkgname}"
}
