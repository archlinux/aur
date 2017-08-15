# Maintainer: chliny <chliny11 at gmail dot com>

pkgname=openlte
_pkgver=v00-20-05
pkgver=v00_20_05
pkgrel=2
pkgdesc="An open source 3GPP LTE implementation."
arch=('any')
url="http://openlte.sourceforge.net"
license=('AGPL')
depends=('gnuradio' 'gnuradio-osmosdr' 'libuhd' 'bladerf' 'mbedtls')
install=openlte.install
source=(
    "https://sourceforge.net/projects/${pkgname}/files/${pkgname}_${_pkgver}.tgz"
    "${pkgname}.patch"
    )
sha512sums=(
    '396969c118fb6ed63727a38a8ada368463fa8a9e7ca239be7b2a29a29ad55ba3add4172624972f31d1a14d0707f4ae2dd50b3a1d288d0943bebe3a381aa27b87'
    '8b531969eae0f86dffeb10a208ef2ba67fa197d9e36db714c5af6e139b9369eec7068759a190ae187f81c2d42a67d36c59cefd1c469af71fed1d297c6b5dc707'
    )

build() {
    cd "${srcdir}/${pkgname}_${_pkgver}"
    patch -p1 < ../../${pkgname}.patch
    mkdir -p build
    mkdir -p install
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=../install ../
    make && make install
}

package() {
    cd "${srcdir}/${pkgname}_${_pkgver}/install"

    mkdir -p "${pkgdir}/usr/share/${pkgname}"

    mv bin "${pkgdir}/usr/"
    mv include "${pkgdir}/usr/"
    mv lib "${pkgdir}/usr/"

    install -Dm755 ../enodeb_nat_script.sh  "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 ../README "${pkgdir}/usr/share/${pkgname}"
}
