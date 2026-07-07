# Maintainer: taotieren <admin@taotieren.com>

pkgname=opengnb
pkgver=1.6.6
pkgrel=2
pkgdesc="GNB is open source de-centralized VPN to achieve layer3 network via p2p with the ultimate capability of NAT Traversal."
arch=($CARCH)
url="https://github.com/gnbdev/opengnb"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    bash
    glibc)
optdepends=()
makedepends=(
    git
    sed
    # libnatpmp
    # miniupnpc
    # zlib
)
backup=()
options=('!makeflags' '!debug')
install=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('acfa2f05186a903e95cf8a3e16303943b34c0c6e5e97d39b68abb9f6393b09eb')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    #     sed -i -e 's|-I./libs|-I./libs -I/usr/include|g' \
    #         -e 's|-I./libs/miniupnpc/|-I/usr/include/miniupnpc|g' \
    #         -e 's|-I./libs/libnatpmp | |g' \
    #         -e 's|-I./libs/zlib | |g' \
    #         -e 's| -pthread| -pthread -z relro -z now -z shstk|g' Makefile.linux
    sed -i -e 's| -pthread| -pthread -z relro -z now -z shstk|g' Makefile.linux
    sed -i -e 's|sbin|bin|g' scripts/opengnb\@.service
}

build() {
    cd "${srcdir}/${pkgname}"
    make -f Makefile.linux
}

package() {
    cd "${srcdir}/${pkgname}"
    make -f Makefile.linux install

    install -Dm0755 bin/* -t "${pkgdir}/usr/bin/"
    install -Dm0644 scripts/${pkgname}@.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm0644 examples/node_config_example/*.conf -t "${pkgdir}/usr/share/${pkgname}/node_config_example/"
    install -Dm0644 examples/node_config_example/scripts/* -t "${pkgdir}/usr/share/${pkgname}/node_config_example/scripts/"
    install -Dm0644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}/docs/"
    install -Dm0644 README* -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
