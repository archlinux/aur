# Maintainer: FenixFyreX <chaz.domerese@gmail.com>

pkgname=amixst
pkgver=1.0.0
pkgrel=1
pkgdesc='A free and open source volume wheel using Alsa and Qt5.'
arch=('i686' 'x86_64')
url='https://github.com/FenixFyreX/amixst'
license=('GPL3')

depends=('qt5-base' 'alsa-lib')
makedepends=('git' 'qt5-tools' 'gcc')
optdepends=('qt5-styleplugins: more Qt5 styles')
provides=("${pkgname}=${pkgver}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FenixFyreX/amixst/archive/${pkgver}.tar.gz")

md5sums=("d603599e0338a37e79f0e45974e68a87")

prepare() {
    mkdir -p "${srcdir}"/build
}

build() {
    cd "${srcdir}"/build
    qmake-qt5 "../amixst-${pkgver}"/src/amixst.pro \
        CONFIG+=release     \
        -spec linux-g++
    
    make -j $(grep -c ^processor /proc/cpuinfo)
}

package() {
    cd "${srcdir}"/build
    
    install -dm644 "${pkgdir}"/usr/bin
    install -m755 "${srcdir}"/build/amixst "${pkgdir}"/usr/bin
    
    install -dm644 "${pkgdir}"/etc/amixst
    install -m755 "${srcdir}/amixst-${pkgver}"/etc/conf "${pkgdir}"/etc/amixst/conf
    
    install -dm644 "${pkgdir}"/usr/share/amixst
    install -m755 "${srcdir}/amixst-${pkgver}"/COPYING "${pkgdir}"/usr/share/amixst
    install -m755 "${srcdir}/amixst-${pkgver}"/LICENSE "${pkgdir}"/usr/share/amixst
}
