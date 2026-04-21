# Maintainer: taotieren <admin@taotieren.com>

pkgname=flashmq
pkgver=1.26.1
pkgrel=1
pkgdesc="FlashMQ is a light-weight MQTT broker/server, designed to take good advantage of multi-CPU environments"
arch=($CARCH)
url="https://github.com/halfgaar/FlashMQ"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(
    gcc-libs
    glibc
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
sha256sums=('dda15c55760cb5cfa82aa2184daba852290e37d794260fd43732470d5e875796')

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
