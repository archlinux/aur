# Contributor: taotieren <admin@taotieren.com>

pkgname=opengnb-git
pkgver=1.4.5.a
pkgrel=0
pkgdesc="GNB is open source de-centralized VPN to achieve layer3 network via p2p with the ultimate capability of NAT Traversal."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/gnbdev/opengnb"
license=('GPLv3')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=()
optdepends=()
makedepends=(git
    sed
    libnatpmp
    miniupnpc
    zlib)
backup=()
options=('!strip')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags --always | sed 's/^v//' | sed 's|-|.|g'
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx

    cd "${srcdir}/${pkgname}"
    sed -i 's|-I./libs|-I./libs -I/usr/include|g'  Makefile.linux
    sed -i 's|-I./libs/miniupnpc/|-I/usr/include/miniupnpc|g'  Makefile.linux
    sed -i 's|-I./libs/libnatpmp | |g'  Makefile.linux
    sed -i 's|-I./libs/zlib | |g'  Makefile.linux
}

build() {
    cd "${srcdir}/${pkgname}"
    make -f Makefile.linux
}

package() {
    cd "${srcdir}/${pkgname}"
    make -f Makefile.linux install

    install -Dm0755  bin/* -t "${pkgdir}/usr/bin/"
    install -Dm0644  scripts/${pkgname%-git}@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm0644  examples/node_config_example/*.conf -t "${pkgdir}/usr/share/${pkgname%-git}/node_config_example/"
    install -Dm0644  examples/node_config_example/scripts/* -t "${pkgdir}/usr/share/${pkgname%-git}/node_config_example/scripts/"
    install -Dm0644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname%-git}/docs/"
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
