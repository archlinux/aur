# Maintainer: Vasya Novikov <vnnn91@yandex.ru> (replace "nnn" with a single "n")

pkgname=jitsi-meet-electron
pkgver=2.3.0
pkgrel=1
pkgdesc="Jitsi Meet desktop application powered by Electron"
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

sha256sums=('d4ce7836a838be92d6484813737c424074a7747fd1b7eed9fbc061c4b2cd10cf'
            '76b2fc6c3fba492f07fc08d6d57acd181425ebc4a06ceb16918a9ba42145aae2')

build() {
    cd "${pkgname}-${pkgver}"
    #### TODO: compile against system electron:
    #### https://wiki.archlinux.org/index.php/Electron_package_guidelines
    #### patches welcomed!
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

