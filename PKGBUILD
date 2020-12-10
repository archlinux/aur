# Maintainer: Vasya Novikov <vnnn91@yandex.ru> (replace "nnn" with a single "n")

# Note:
# If you want to use the system version of electron, check out jitsi-meet-desktop on AUR.
# This will use the ArchLinux version of electron.
# This will also reduce your installation size and make sure
# you get the latest version of electron when possible.
#
# If you want to use the stand-alone version from npm, this package is the way to go.
# It follows the official guidelines more closely and might be more stable.
#
# If unsure, try the system electron first, and fallback to this package if system won't work.

pkgname=jitsi-meet-electron
pkgver=2.4.2
pkgrel=1
pkgdesc="Jitsi Meet desktop application powered by Electron. Uses npm version of electron"
arch=('any')
url="https://github.com/jitsi/jitsi-meet-electron"
license=('APACHE-2.0')
depends=('npm')
optdepends=(
    'nodejs-webpack: build-time dependency, to avoid re-downloading it'
    'nodejs-webpack-cli: build-time dependency, to avoid re-downloading it'
)
source=(
    jitsi-meet-electron.desktop
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    'd4ce7836a838be92d6484813737c424074a7747fd1b7eed9fbc061c4b2cd10cf'
    '974c4a8d91b7ea93baaaefbaa4344da44e9590162ae73a70156c4c714265822f'
)

build() {
    cd "${pkgname}-${pkgver}"
    npm install
    npm run dist
}

package() {
    cd "${pkgname}-${pkgver}"

    mkdir -p -- "$pkgdir"/usr/share/applications
    cp -a --dereference -- ../jitsi-meet-electron.desktop "$pkgdir"/usr/share/applications/

    mkdir -p -- "$pkgdir"/usr/share
    cp -aT -- ./dist/linux-unpacked "$pkgdir"/usr/share/jitsi-meet-electron

    mkdir -p -- "$pkgdir"/usr/bin
    ln -s -- '../share/jitsi-meet-electron/jitsi-meet' "$pkgdir"/usr/bin/jitsi-meet-electron

    local icon_size; for icon_size in 16 24 32 48 64 96 128 256 512; do
    install -Dm644 -- "./resources/icons/icon_${icon_size}x${icon_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${pkgname}.png"
    done
}

