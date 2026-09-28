# Maintainer: taotieren <admin@taotieren.com>

pkgname=flashmq
pkgver=1.27.2
pkgrel=1
pkgdesc="FlashMQ is a light-weight MQTT broker/server, designed to take good advantage of multi-CPU environments"
arch=($CARCH)
url="https://github.com/halfgaar/FlashMQ"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(
    libgcc_s.so
    libstdc++.so
    openssl
)
makedepends=(
    git
    cmake
    ninja
    sed
    docbook2x
    libxslt
)
backup=('etc/flashmq/flashmq.conf')
options=('!strip' '!emptydirs')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('580e1dac0583ebc226dedb8e752e5625eb538294a446a8ab1a415d5df4085b3a')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    sed --in-place 's#DESTINATION "/lib#DESTINATION "/usr/lib#' CMakeLists.txt
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -G Ninja
    ninja -C build

    cd man
    make -j
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
