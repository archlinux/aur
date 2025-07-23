# Maintainer: Damglador <vse.stopchanskyi@gmail.com>
# Thanks to copygirl for the main vintagestory packages, which this one is based on

pkgname=vintagestory-unstable
_pkgname=vintagestory

# _release is the version's release type, commonly "stable" for normal releases,
# "unstable" for release candidates and "pre" for testing releases before big updates.
_release=unstable
# _pkgver is separate to allow specifying pre-release versions such as "-rc.1".
_pkgver=1.21.0-rc.1

# makepkg doesn't support hyphens in pkgver, so we'll strip them as per `vercmp`.
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Uncompromising wilderness survival sandbox game (unstable branch)"
arch=("x86_64")
url="https://www.vintagestory.at/"
license=("custom")
depends=("dotnet-runtime-8.0" "opengl-driver" "openal" "glibc>=2.34")
options=("!strip")
source=("https://cdn.vintagestory.at/gamefiles/$_release/vs_client_linux-x64_$_pkgver.tar.gz"
#       "https://account.vintagestory.at/files/$_release/vs_client_linux-x64_$_pkgver.tar.gz" (alternative source)
        "$_pkgname.desktop"
        "vsmodinstall-handler.desktop")
md5sums=("4e5a6cb948c6215cbff03055300fc233"
         "34784dd754e0a7d0e4033a3da89742cd"
         "dde267f52d41fb90641b6405dccb5cd3")

prepare() {
	# Remove install script provided by developers
	rm "$_pkgname"/install.sh
	# Create symbolic links for any assets (excluding fonts) containing non-lowercase letters
	# Some asset files might include uppercase letters, but the game expects them to be lowercase
	find "$_pkgname"/assets/ -not -path "*/fonts/*" -regex ".*/.*[A-Z].*" | while read -r file; do
		local filename="$(basename -- "$file")"
		ln -sf "$filename" "${file%/*}"/"${filename,,}"
	done
}

package() {
	# Copy application icon and .desktop files
	install -Dm644 "$_pkgname"/assets/gameicon.xpm "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm
	install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
	install -Dm644 vsmodinstall-handler.desktop "$pkgdir"/usr/share/applications/"$pkgname"-modinstall-handler.desktop
	# Copy fonts to /usr/share/fonts
	install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF/ "$_pkgname"/assets/game/fonts/*.ttf
	# Copy all other application files
	cp -rdp --no-preserve=ownership "$_pkgname" "$pkgdir"/usr/share/"$pkgname"
	# Create a symlink to run the game from terminal
	install -dm 755 "$pkgdir"/usr/bin/ # Create directory first (required)
	ln -s /usr/share/"$pkgname"/Vintagestory "$pkgdir"/usr/bin/"$pkgname"
}
