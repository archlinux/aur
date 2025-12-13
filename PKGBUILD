# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ml
# Contributor: sum01 <sum01@protonmail.com>

pkgname=rocketchat-desktop
pkgver=4.10.1
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron'
arch=(any)
url=https://github.com/RocketChat/Rocket.Chat.Electron
license=(MIT)
_electron=electron39
depends=("$_electron" nodejs libvips)
makedepends=(node-gyp yarn asar python-distutils-extra openjpeg2)
install=rocketchat-desktop.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        rocketchat-desktop.desktop)
sha256sums=('a23ac6cd8fb651969e91850f85dcd83d7b89d170dae353b9b35c266abfc6c735'
            '31fae4f98a61a774f84030fd43d2ef92c7633740dc5aa55967a21d0e29ea621a')
# validpgpkeys=('9EA06BE6FD613A03') # Tasso Evangelista

prepare() {
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
         -c.electronVersion="$(</usr/lib/${_electron}/version)"
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
