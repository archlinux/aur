# Contributor: taotieren <admin@taotieren.com>

pkgname=opengnb
pkgver=1.4.5.a
pkgrel=1
pkgdesc="GNB is open source de-centralized VPN to achieve layer3 network via p2p with the ultimate capability of NAT Traversal."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/gnbdev/opengnb"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=('miniupnpc')
optdepends=()
makedepends=()
backup=()
options=('!strip')
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b935b7f2715bd1e004783213c8bc54d9a911c3f902d9d19cd9567b68bd797870')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's|-I./libs/miniupnpc|-I/usr/include/miniupnpc/|g'  Makefile.linux
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.linux
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.linux install
    install -dm0755 "${pkgdir}/usr" \
                    "${pkgdir}/usr/lib/systemd/system/" \
                    "${pkgdir}/usr/share/${pkgname}/"
    cp -rv bin "${pkgdir}/usr"
    cp -rv scripts/${pkgname}@.service "${pkgdir}/usr/lib/systemd/system/"
    cp -rv examples/* "${pkgdir}/usr/share/${pkgname}/"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
