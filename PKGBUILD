# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: ml
# Contributor: sum01 <sum01@protonmail.com>

pkgname=rocketchat-desktop
pkgver=3.8.15
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('any')
url='https://github.com/RocketChat/Rocket.Chat.Electron'
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('node-gyp' 'yarn' 'asar')
install=rocketchat-desktop.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        rocketchat-desktop
        rocketchat-desktop.desktop)
sha256sums=('d5a052dc0c80e1bd79603d23548e15f03711f84746d6cb44832fc6e01652033b'
            '5fe8f552b4ac1917a1bb08e86f957e9b892220a2aab59b88e8256e2e092e1b1c'
            '31fae4f98a61a774f84030fd43d2ef92c7633740dc5aa55967a21d0e29ea621a')
# validpgpkeys=('9EA06BE6FD613A03') # Tasso Evangelista

prepare() {
    _ver="$(</usr/lib/electron/version)"
    cd "Rocket.Chat.Electron-$pkgver"
    yarn upgrade "electron@$_ver"
}

build() {
    cd "Rocket.Chat.Electron-$pkgver"
    local i686=ia32 x86_64=x64
    export NODE_ENV=production
    export NODE_OPTIONS='--openssl-legacy-provider'
    yarn build
    yarn run electron-builder --linux --"${!CARCH}" --dir \
         -c.electronDist=/usr/lib/electron \
         -c.electronVersion="$_ver"
}

package() {
    local i686=linux-ia32-unpacked x86_64=linux-unpacked
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -D -t "${pkgdir}/usr/bin" "$pkgname"

    cd "Rocket.Chat.Electron-$pkgver"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -d "$pkgdir/usr/lib/$pkgname/"
    asar e "dist/${!CARCH}/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
}
