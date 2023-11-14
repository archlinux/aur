# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml
# Contributor: sum01 <sum01@protonmail.com>

pkgname=rocketchat-desktop
pkgver=3.9.10
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron'
arch=(any)
url=https://github.com/RocketChat/Rocket.Chat.Electron
license=(MIT)
_electron=electron24
depends=("$_electron" nodejs libvips)
makedepends=(node-gyp yarn asar)
install=rocketchat-desktop.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        rocketchat-desktop.desktop)
sha256sums=('594c8c3de30e14b13e9990f6972c8c9390a2df4403a31569c4e599adac512ca4'
            '31fae4f98a61a774f84030fd43d2ef92c7633740dc5aa55967a21d0e29ea621a')
# validpgpkeys=('9EA06BE6FD613A03') # Tasso Evangelista

prepare() {
    _ver="$(</usr/lib/${_electron}/version)"
    cd "Rocket.Chat.Electron-$pkgver"
    yarn install
}

build() {
    cd "Rocket.Chat.Electron-$pkgver"
    local i686=ia32 x86_64=x64
    export NODE_ENV=production
    export NODE_OPTIONS='--openssl-legacy-provider'
    yarn build
    yarn run electron-builder --linux --"${!CARCH}" --dir \
         -c.electronDist=/usr/lib/"$_electron" \
         -c.electronVersion="$_ver"
}

package() {
    local i686=linux-ia32-unpacked x86_64=linux-unpacked aarch64=linux-arm64-unpacked
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
    cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/rocketchat-desktop "\$@"
EOD
    cd "Rocket.Chat.Electron-$pkgver"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -d "$pkgdir/usr/lib/$pkgname/"
    asar e "dist/${!CARCH}/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
}
