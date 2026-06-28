# Maintainer: Matt <matthew.panton@gmail.com>
pkgname=nexus-open
pkgver=0.3.6
pkgrel=1
pkgdesc="Linux controller for Corsair iCUE Nexus display device"
arch=('x86_64')
url="https://github.com/mantonx/nexus-open"
license=('MIT')
depends=('libayatana-appindicator' 'gtk3' 'libgl' 'libgles' 'libegl')
install=nexus-open.install
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('6caab8a2759729ee9bf7d325e7d2661a15d0787f66ff0b9c05fcb052eee0d939')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 nexus-open \
        "${pkgdir}/usr/bin/nexus-open"

    for plugin in plugins-dist/nexus-*; do
        install -Dm755 "$plugin" \
            "${pkgdir}/usr/lib/nexus-open/plugins/$(basename "$plugin")"
    done

    install -Dm644 packaging/udev/99-corsair-nexus.rules \
        "${pkgdir}/usr/share/nexus-open/99-corsair-nexus.rules"

    install -Dm644 packaging/systemd/nexus-open.service \
        "${pkgdir}/usr/lib/systemd/user/nexus-open.service"

    install -Dm644 packaging/desktop/nexus-open.desktop \
        "${pkgdir}/usr/share/applications/nexus-open.desktop"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    if [[ -d ui-bundle ]]; then
        cp -r ui-bundle "${pkgdir}/usr/lib/nexus-open/"
        chmod 755 "${pkgdir}/usr/lib/nexus-open/ui-bundle/ui"
        chmod 755 "${pkgdir}/usr/lib/nexus-open/ui-bundle/ui.real"
    fi
}
