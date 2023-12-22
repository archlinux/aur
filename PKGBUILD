# Contributor: taotieren <admin@taotieren.com>

pkgname=opengnb
pkgver=1.4.5.a
pkgrel=2
pkgdesc="GNB is open source de-centralized VPN to achieve layer3 network via p2p with the ultimate capability of NAT Traversal."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/gnbdev/opengnb"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=()
optdepends=()
makedepends=(sed
    libnatpmp
    miniupnpc
    zlib)
backup=()
options=('!strip')
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a68817d63dcf3e15166b52389e5bc46affcf18f910932dd8dd8eb7247eb47b9a')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's|-I./libs|-I./libs -I/usr/include|g'  Makefile.linux
    sed -i 's|-I./libs/miniupnpc/|-I/usr/include/miniupnpc|g'  Makefile.linux
    sed -i 's|-I./libs/libnatpmp | |g'  Makefile.linux
    sed -i 's|-I./libs/zlib | |g'  Makefile.linux
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.linux
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.linux install

    install -Dm0755 bin/* -t "${pkgdir}/usr/bin/"
    install -Dm0644 scripts/${pkgname}@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm0644 examples/node_config_example/*.conf -t "${pkgdir}/usr/share/${pkgname}/node_config_example/"
    install -Dm0644 examples/node_config_example/scripts/* -t "${pkgdir}/usr/share/${pkgname}/node_config_example/scripts/"
    install -Dm0644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}/docs/"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
