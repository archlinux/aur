# Maintainer: copygirl <copygirl@mcft.net>
pkgname=vintagestory
pkgver=1.8.1
pkgrel=1
pkgdesc="An in-development indie sandbox game about innovation and exploration"
arch=("any")
url="https://www.vintagestory.at/"
license=("custom")
depends=("mono")
source=("https://account.vintagestory.at/files/stable/vs_archive_$pkgver.tar.gz"
        "vintagestory.desktop"
        "vintagestory.sh")
md5sums=("01c5ce603e4bdab4186a9a32e6e69811"
         "7cf82f218ba3026aff620b131b7dc581"
         "da232b56f48e047ec60791bb7d8b6398")

prepare() {
	# Create symbolic links for any assets (excluding fonts) containing non-lowercase letters
	find "$pkgname"/assets/ -not -path "*/fonts/*" -regex ".*/.*[A-Z].*" | while read -r file; do
		local filename="$(basename -- "$file")"
		ln -sf "$filename" "${file%/*}"/"${filename,,}"
	done
}

package() {
	# Copy console launcher .sh
	install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
	# Copy application icon and .desktop launcher file
	install -Dm644 "$pkgname"/assets/gameicon.xpm "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm
	install -Dm644 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
	# Copy fonts
	install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF/ "$pkgname"/assets/game/fonts/*.ttf
	# Move application files
	mv "$pkgname" "$pkgdir"/usr/share/"$pkgname"
}
