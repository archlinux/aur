# Maintainer: taotieren <admin@taotieren.com>

pkgname=flashmq
_pkgname=FlashMQ
pkgver=1.0.0
pkgrel=1
pkgdesc="FlashMQ is a light-weight MQTT broker/server, designed to take good advantage of multi-CPU environments"
arch=('any')
url="https://github.com/halfgaar/FlashMQ"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=()
makedepends=(cmake ninja sed docbook2x libxslt)
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dc08e06f0e56fb956fd1dfd9064d885f824df25d9cb8282774696018338bec6c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    sed --in-place 's#DESTINATION "/lib#DESTINATION "/usr/lib#' CMakeLists.txt
    cmake -B build \
          -DCMAKE_BUILD_TYPE=Release \
          -G Ninja
    ninja -C build

    cd man
    sed -i 's#docbook2x-man#db2x_docbook2man#g' Makefile
    make -j
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${_pkgname}-${pkgver}/build install
}
