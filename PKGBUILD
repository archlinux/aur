# Maintainer: Bruce Zhang
pkgname=electron-wechat
_name=freechat
pkgver=1.0.0
pkgrel=1
pkgdesc='致力于打造macOS和Linux桌面下最好用的微信（wechat）客户端'
arch=('x86_64' 'i686')
url='https://github.com/eNkru/freechat'
license=('MIT')
provides=('wechat' 'freechat')
depends=('electron')
makedepends=('jq' 'moreutils' 'npm')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/eNkru/freechat/archive/v$pkgver.tar.gz")
sha256sums=('0e8de3acaaa2eaf0a19e332733ea033bc35a9499d008f90891e566d718a28904')

prepare() {
	cd "$srcdir/$_name-$pkgver"
    electronDist="\/usr\/lib\/electron"
    electronVersion=$(tail -1 /usr/lib/electron/version)
    electronVersion=${electronVersion#'v'}
    sed -i "s|\"electron\": \".*|\"electron\": \"$electronVersion\",|" package.json
    jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json
    jq ".scripts[\"dist:linux\"] = \"electron-builder --linux dir\"" package.json | sponge package.json
    npm install
}

build() {
    cd "$srcdir/$_name-$pkgver"
    npm run pack
}

package() {
	cd "$srcdir/$_name-$pkgver/dist/linux-unpacked/resources"
    # Install app
    install -Dm644 app.asar "$pkgdir/usr/share/electron-wechat/app.asar"

    # Install start script
    echo "#!/usr/bin/env sh
exec electron /usr/share/electron-wechat/app.asar
    " > "$srcdir/electron-wechat.sh"
    install -Dm755 "$srcdir/electron-wechat.sh" "$pkgdir/usr/bin/electron-wechat"

    # Install desktop file
    echo "[Desktop Entry]
Name=Freechat
Comment=Wechat desktop application
Exec=electron-wechat %U
Terminal=false
Type=Application
Icon=electron-wechat
StartupWMClass=freechat
X-AppImage-Version=$pkgver
Categories=Network;Utility;
    " > "$srcdir/electron-wechat.desktop"
    install -Dm644 "$srcdir/electron-wechat.desktop" "$pkgdir/usr/share/applications/electron-wechat.desktop"

    # Install icons
    cd "$srcdir/$_name-$pkgver/build/icons"
    for size in 12 16 32 48 64 128 256 512; do
        install -Dm644 "${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/electron-wechat.png"
    done
}
