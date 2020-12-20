# Maintainer: Philipp Reger <philipp.reger@outlook.com>

pkgname=datcom-jitsi-meet-electron
pkgver=2.4.300
pkgrel=9
pkgdesc="DatCom Jitsi Meet Desktop"
arch=('x86_64')
url="https://github.com/datcom-unibw/jitsi-meet-electron"

license=('APACHE-2.0')

conflicts=('jitsi-meet-electron-bin' 'jitsi-meet-electron')

depends=('npm')

makedepends=('git' 'make')

optdepends=(
    'nodejs-webpack: build-time dependency, to avoid re-downloading it'
    'nodejs-webpack-cli: build-time dependency, to avoid re-downloading it'
)

source=(
  jitsi-meet-electron.desktop
  "jitsi-meet-electron-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)

sha256sums=('b88ca14b81b13e1480532b70a1a319a276909c617ac868c233a87e5261a6e119'
            '604ccf0a6ef445f9df03d33fe17ed3d57db547d734154e394c92611b0a22c688')

build() {
	cd jitsi-meet-electron-${pkgver}/
	npm install
	npm audit fix
	npm run dist
}

package() {
	cd "jitsi-meet-electron-${pkgver}"

    mkdir -p -- "$pkgdir"/usr/share/applications
    cp -a --dereference -- ../jitsi-meet-electron.desktop "$pkgdir"/usr/share/applications/

    mkdir -p -- "$pkgdir"/usr/share
    cp -aT -- ./dist/linux-unpacked "$pkgdir"/usr/share/jitsi-meet-electron

    mkdir -p -- "$pkgdir"/usr/bin
    ln -s -- '../share/jitsi-meet-electron/jitsi-meet' "$pkgdir"/usr/bin/jitsi-meet-electron

    local icon_size; for icon_size in 16 24 32 48 64 96 128 256 512; do
    install -Dm644 -- "./resources/icons/icon_${icon_size}x${icon_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/jitsi-meet-electron.png"
    done
}
