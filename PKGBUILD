# Maintainer: Ellis Clayton <ellis@ellis.codes>
pkgname=ha-localizer-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="Provide timezone and geolocation information to Linux systems via Home Assistant"
arch=('x86_64' 'aarch64')
url="https://github.com/ellsclytn/ha-localizer"
license=('MIT')
depends=()
options=('!debug')
optdepends=(
    'geoclue: for ha-geoip location services'
    'systemd: for systemd service units'
    'networkd-dispatcher: for automatic timezone sync on network changes'
)
backup=('etc/ha-localizer.toml')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
source_x86_64=("${pkgname%-bin}-ha-geoip-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/ha-geoip-x86_64-unknown-linux-gnu.tar.gz"
    "${pkgname%-bin}-ha-timezone-sync-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/ha-timezone-sync-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname%-bin}-ha-geoip-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/ha-geoip-aarch64-unknown-linux-gnu.tar.gz"
    "${pkgname%-bin}-ha-timezone-sync-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/ha-timezone-sync-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('4ff5d0c58c44779554eb74b4191427667048679940efc10eecd6a83c1a27c864')
sha256sums_x86_64=('6cab3a92c6889362d5373bd4a53c13646c1a5fc6576a2d9744fe4a645b76803d' '30f10e46a03350b45a37797fa5c5c3d6bbd5ae1367644938693d5c1b56020eb0')
sha256sums_aarch64=('f06f56b98095ba09354fdb2f28d259a4d8fee9eac206de3603d985632626c862' '4edf46e2556ab76bfa9e2530b65382f938ac8697480ffeb98ae4af5e8f4a45df')

package() {
    cd "${srcdir}/${pkgname%-bin}-${pkgver}"

    install -Dm644 dist/config/ha-localizer.toml "${pkgdir}/etc/ha-localizer.toml"

    install -Dm644 dist/systemd/user/ha-geoip.service \
        "${pkgdir}/usr/lib/systemd/user/ha-geoip.service"
    install -Dm644 dist/systemd/system/ha-timezone-sync.service \
        "${pkgdir}/usr/lib/systemd/system/ha-timezone-sync.service"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd "${srcdir}"
    install -Dm755 ha-geoip "${pkgdir}/usr/bin/ha-geoip"
    install -Dm755 ha-timezone-sync "${pkgdir}/usr/bin/ha-timezone-sync"
}
