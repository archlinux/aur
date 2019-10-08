# Maintainer: sandsmark <martin.sandsmark@kde.org>

pkgname=mitie-git
_pkgname=MITIE
pkgrel=1
pkgver=r5150.832cbd6f
pkgdesc="MITIE: library and tools for information extraction"
arch=('i686' 'x86_64')
url="https://github.com/mit-nlp/MITIE"
license=('Boost Software License')
depends=('openblas')
makedepends=('git' 'cmake')
source=("git+https://github.com/mit-nlp/${_pkgname}")
sha256sums=(SKIP)
provides=('mitie')
conflicts=('mitie')
replaces=('mitie')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}/mitielib"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \

    make
}

package() {
    cd "${srcdir}/${_pkgname}/mitielib/"

    # The install target in the CMakeLists.txt is broken
    install -d -m755 "${pkgdir}/usr/lib/"
    install -m755 build/libmitie.so "${pkgdir}/usr/lib/"

    install -d -m755 "${pkgdir}/usr/include/mitie/"
    install -m644 include/mitie/*.h "${pkgdir}/usr/include/mitie/"
}
