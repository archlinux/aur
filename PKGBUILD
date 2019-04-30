# Maintainer: Bruce Zhang
pkgname=gridea
pkgver=0.8.0
pkgrel=1
pkgdesc="静态博客写作客户端"
arch=('x86_64' 'i686')
url="https://gridea.dev/"
license=('MIT')
depends=('electron')
makedepends=('imagemagick')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/getgridea/gridea/archive/v$pkgver.tar.gz")
sha256sums=('c5b3f4708d86f0f3e6e90996c44a56735e291891dd9341639e20b1667d657c6b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    sed -i "/asar: false,/c\asar: true,linux: {target: ['dir']}," vue.config.js
    yarn
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    yarn electron:build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

    install -Dm644 ./dist_electron/linux-unpacked/resources/app.asar "$pkgdir/usr/share/gridea/app.asar"

    for size in 16 24 32 48 64 72 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p "$target"
        convert ./public/app-icons/gridea.png -resize ${size}x${size} "$target/gridea.png"
    done

    echo "#!/usr/bin/env sh
exec electron /usr/share/gridea/app.asar" > "$srcdir/gridea.sh"
	install -Dm755 "$srcdir/gridea.sh" "$pkgdir/usr/bin/gridea"

	echo "[Desktop Entry]
Name=Gridea
Name[zh_CN]=Gridea
Comment=A static blog writing client
Comment[zh_CN]=一个静态博客写作客户端
Exec=/usr/bin/gridea %U
Terminal=false
Type=Application
Icon=gridea
Categories=Utility;" > "$srcdir/gridea.desktop"
	install -Dm644 "$srcdir/gridea.desktop" "$pkgdir/usr/share/applications/gridea.desktop"
}
