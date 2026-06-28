# Maintainer: Matt <matthew.panton@gmail.com>
pkgname=nexus-open
pkgver=0.3.8
pkgrel=1
pkgdesc="Linux controller for Corsair iCUE Nexus display device"
arch=('x86_64')
url="https://github.com/mantonx/nexus-open"
license=('MIT')
depends=('libayatana-appindicator' 'gtk3' 'libgl' 'libgles' 'libegl')
install=nexus-open.install
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('4a14c99623759bf5afee31b92b0f3c1d631cb3429f28ba3d13b4a44acc7f303e')

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
