# Maintainer: Bruce Zhang
pkgname=i5sing
_name=i5SING
pkgver=0.2.1
pkgrel=1
pkgdesc='中国原创音乐基地5sing桌面客户端'
arch=('x86_64' 'i686')
url='https://github.com/i5sing/i5SING'
license=('MIT')
provides=('i5sing')
conflicts=('i5sing-git' 'i5sing-bin')
depends=('electron4')
makedepends=('yarn')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/i5sing/i5SING/archive/v$pkgver.tar.gz")
sha256sums=('03f29f3cedec73dbd579f718e451cdd4c0a8f298599318225d5ce49c982febbf')

prepare() {
	cd "$srcdir/$_name-$pkgver"
    yarn
}

build() {
    cd "$srcdir/$_name-$pkgver"
    yarn run package
}

package() {
	cd "$srcdir/$_name-$pkgver/out/$pkgname-linux-x64"

    # Install app
    install -Dm644 resources/app.asar "$pkgdir/usr/share/i5sing/app.asar"

    # Install start script
    echo "#!/usr/bin/env sh
exec electron4 /usr/share/i5sing/app.asar
    " > "$srcdir/i5sing.sh"
    install -Dm755 "$srcdir/i5sing.sh" "$pkgdir/usr/bin/i5sing"

    # Install desktop file
    echo "[Desktop Entry]
Name=i5SING
Comment=爱生活,爱音乐,爱5SING
Exec=/usr/bin/i5sing %U
Terminal=false
Type=Application
Icon=i5sing
StartupWMClass=i5SING
Categories=AudioVideo;Player;
    " > "$srcdir/i5sing.desktop"
    install -Dm644 "$srcdir/i5sing.desktop" "$pkgdir/usr/share/applications/i5sing.desktop"

    # Install icons
    cd "$srcdir/$_name-$pkgver/src/assets"
    install -Dm644 i5sing.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/i5sing.png"
}
