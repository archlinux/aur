# Maintainer: copygirl <copygirl@mcft.net>
pkgname=vintagestory

# _release is the version's release type, commonly "stable" for normal releases,
# "unstable" for release candidates and "pre" for testing releases before big updates.
_release=stable
# _pkgver is separate to allow specifying pre-release versions such as "-rc.1".
_pkgver=1.12.11

# makepkg doesn't support hyphens in pkgver. They'll be replaced with underscores.
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="An in-development indie sandbox game about innovation and exploration"
arch=("any")
url="https://www.vintagestory.at/"
license=("custom")
depends=("mono" "opengl-driver" "openal")
source=("https://cdn.vintagestory.at/gamefiles/$_release/vs_archive_$_pkgver.tar.gz"
#       "https://account.vintagestory.at/files/$_release/vs_archive_$_pkgver.tar.gz" (alternative source)
        "vintagestory.desktop"
        "vintagestory.sh")
md5sums=("41df3ef6980d48448994727d7b9a0da5"
         "ab6680c4499b58b14aa36acc2ab4038a"
         "da232b56f48e047ec60791bb7d8b6398")

prepare() {
	# Create symbolic links for any assets (excluding fonts) containing non-lowercase letters
	find "$pkgname"/assets/ -not -path "*/fonts/*" -regex ".*/.*[A-Z].*" | while read -r file; do
		local filename="$(basename -- "$file")"
		ln -sf "$filename" "${file%/*}"/"${filename,,}"
	done
}

package() {
	# Copy terminal launcher script
	install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
	# Copy application icon and .desktop launcher file
	install -Dm644 "$pkgname"/assets/gameicon.xpm "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm
	install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
	# Copy fonts
	install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF/ "$pkgname"/assets/game/fonts/*.ttf
	# Move application files
	mv "$pkgname" "$pkgdir"/usr/share/"$pkgname"
}
