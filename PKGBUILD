# Maintainer: taotieren <admin@taotieren.com>

pkgname=flashmq
pkgver=1.24.0
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
backup=()
options=('!strip' '!emptydirs')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('21a5060df26da2210cf34148a165aa0136ccfa378136f34182327d403a3cb457')

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
