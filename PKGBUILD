# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=majsoul-plus
pkgver=1.10.6
pkgrel=5
pkgdesc="Majsoul browser, with more features"
arch=('x86_64')
url="https://github.com/MajsoulPlus/majsoul-plus"
license=('AGPL3')
depends=('electron')
makedepends=('npm' 'imagemagick')
source=("https://github.com/MajsoulPlus/majsoul-plus/archive/v$pkgver.tar.gz")
sha256sums=('c914845e373d56a5b99b870c1b75f25fbfb930f9ce4eadf7eb733ca41c580b53')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/\"electron/d' package.json
}

build() {
	cd "$pkgname-$pkgver"
	npm install
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/opt/majsoul-plus"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"

	find * -type f -exec install -Dm644 {} "$pkgdir/opt/majsoul-plus/{}" \;

	for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p $target
        convert bin/icons/icon.png -resize ${size}x${size} "$target/majsoul-plus.png"
    done

	echo "#!/usr/bin/env bash
exec electron --enable-logging /opt/majsoul-plus" > "$srcdir/majsoul-plus.sh"
	install -Dm755 "$srcdir/majsoul-plus.sh" "$pkgdir/usr/bin/majsoul-plus"

	echo "[Desktop Entry]
Name=Majsoul Plus
Name[zh_CN]=雀魂 Plus
GenericName[zh_CN]=雀魂 Plus
Comment=Majsoul Plus Browser
Comment[zh_CN]=一款设计用于雀魂麻将的 PC 专用浏览器
Exec=majsoul-plus %U
Terminal=false
Type=Application
Icon=majsoul-plus
Categories=Game;" > "$srcdir/majsoul-plus.desktop"
	install -Dm644 "$srcdir/majsoul-plus.desktop" "$pkgdir/usr/share/applications/majsoul-plus.desktop"
}
