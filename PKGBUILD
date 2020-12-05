# Maintainer: Bruce Zhang
pkgname=i5sing
_name=i5SING
pkgver=0.3.0
pkgrel=1
pkgdesc='中国原创音乐基地5sing桌面客户端'
arch=('x86_64' 'i686')
url='https://github.com/i5sing/i5SING'
license=('MIT')
provides=('i5sing')
conflicts=('i5sing-git' 'i5sing-bin')
depends=('electron9')
makedepends=('nvm' 'yarn')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/i5sing/i5SING/archive/v$pkgver.tar.gz")
sha256sums=('3a5a1fcd37e6783ae81dab1fc3f7a965685692c7eb9b69e8a6926c58ae59a32e')

prepare() {
    source /usr/share/nvm/init-nvm.sh
    v10=$(nvm ls v10.23.0 | wc -l)

    # Switch node version to 10
    if test "$v10" != "1";
    then
        nvm install v10.23.0
    fi
    nvm use v10.23.0

	cd "$srcdir/$_name-$pkgver"
    yarn
}

build() {
    cd "$srcdir/$_name-$pkgver"
    yarn run package

    # Switch node version to system
    if test "$v10" != "1";
    then
        nvm uninstall v10.23.0
    fi
    nvm deactivate
}

package() {
	cd "$srcdir/$_name-$pkgver/out/$pkgname-linux-x64"

    # Install app
    install -Dm644 resources/app.asar "$pkgdir/usr/share/i5sing/app.asar"

    # Install start script
    echo "#!/usr/bin/env sh
exec electron9 /usr/share/i5sing/app.asar
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
