# Maintainer: Ellis Clayton <ellis@ellis.codes>
pkgname=ha-localizer-bin
pkgver=0.2.2
pkgrel=1
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
sha256sums=('9caa25ec560c47a69d0c8f0a1dd891c94c0eb689d155685772e1dc7f3198c07f')
sha256sums_x86_64=('f04ec54d059f99f30dde4a908057d4d05fe296089c37d78b3a28851bee7d14a1' 'd3caab76ddce5d78fe12474ab1f96f07e844508bb3b457d51c20a48f98e4f8ba')
sha256sums_aarch64=('e045f0bb50691e511fcaf34b2367b5fe37787fa3e5f2e901c09a8852cecc6f40' '72536be43ed8282897cde0de809a0ddb62d28e44450e4c2d9f50d3652641b475')

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
