# Maintainer: taotieren <admin@taotieren.com>

pkgname=flashmq
_pkgname=FlashMQ
pkgver=1.15.2
pkgrel=1
pkgdesc="FlashMQ is a light-weight MQTT broker/server, designed to take good advantage of multi-CPU environments"
arch=('any')
url="https://github.com/halfgaar/FlashMQ"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=()
makedepends=(cmake ninja sed libxslt)
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c55d69b91c55bcee9e1c3719128b299c5189b7da481ee78b8ddd7838404031fc')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    sed --in-place 's#DESTINATION "/lib#DESTINATION "/usr/lib#' CMakeLists.txt
    cmake -B build \
          -DCMAKE_BUILD_TYPE=Release \
          -G Ninja
    ninja -C build

    cd man
    make -j
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${_pkgname}-${pkgver}/build install
}
