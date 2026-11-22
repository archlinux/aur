# Maintainer: czyt <czytcn@gmail.com>
pkgname=proxybridge-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="Universal proxy client that routes any Linux application's TCP and UDP traffic through an HTTP/SOCKS5 proxy"
arch=('x86_64' 'aarch64')
url="https://interceptsuite.com/what-is-interceptsuite?github=proxybridge"
license=('MIT')
# The CLI and its library statically bundle libbpf/libelf/zlib; only the GUI
# needs GTK 3. The engine expects root capabilities, provided by its service.
depends=('gtk3' 'libnetfilter_queue' 'libnfnetlink')
optdepends=('iptables: alternative packet redirect setup')
provides=('proxybridge')
conflicts=('proxybridge')
options=('!strip' '!debug')
install='proxybridge-bin.install'

_tag="v${pkgver}_Linux"
source=(
    "proxybridge-${pkgver}-LICENSE::https://raw.githubusercontent.com/InterceptSuite/ProxyBridge/${_tag}/LICENSE"
    "proxybridge-bin.install"
)
source_x86_64=("ProxyBridge-Linux-x64-v${pkgver}_Linux.tar.gz::https://github.com/InterceptSuite/ProxyBridge/releases/download/${_tag}/ProxyBridge-Linux-x64-v${pkgver}_Linux.tar.gz")
source_aarch64=("ProxyBridge-Linux-arm64-v${pkgver}_Linux.tar.gz::https://github.com/InterceptSuite/ProxyBridge/releases/download/${_tag}/ProxyBridge-Linux-arm64-v${pkgver}_Linux.tar.gz")
sha256sums=('525ad01340fd97de6bef499c80f730aed28042d5387b2460f6626184ccb688cb'
            '932687c17f00ec601e1886c48a234e3c0f232162ffdcdf7465718b0d744ac894')
sha256sums_x86_64=('761fa0bdcf58c5ece01747321ded7a7cae457f4db4adabde258d0f29c679bb8f')
sha256sums_aarch64=('e12f1c04391882f7e9b2cb5e3f6aa4893c5f2e6899f0afc9c912e585b21a08b8')

package() {
    local _tar="ProxyBridge-Linux-${CARCH/x86_64/x64}-v${pkgver}_Linux.tar.gz"

    install -Dm755 "${srcdir}/ProxyBridge" "${pkgdir}/usr/bin/ProxyBridge"
    install -Dm755 "${srcdir}/ProxyBridgeGUI" "${pkgdir}/usr/bin/ProxyBridgeGUI"
    install -Dm755 "${srcdir}/libproxybridge.so" \
        "${pkgdir}/usr/lib/libproxybridge.so"

    install -Dm644 "${srcdir}/proxybridge.desktop" \
        "${pkgdir}/usr/share/applications/proxybridge.desktop"
    # The tarball entry points at /usr/local/bin; fix it for a system install.
    sed -i 's|^Exec=.*|Exec=/usr/bin/ProxyBridgeGUI|' \
        "${pkgdir}/usr/share/applications/proxybridge.desktop"
    install -Dm644 "${srcdir}/proxybridge-128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/proxybridge.png"
    install -Dm644 "${srcdir}/proxybridge-256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/proxybridge.png"

    install -d -m 700 "${pkgdir}/etc/proxybridge"
    install -Dm644 "${srcdir}/proxybridge-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
