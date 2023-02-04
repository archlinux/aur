# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade-doc
pkgver=2023.02a
pkgrel=1
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling Documentation"
arch=("any")
url='https://yade-dem.org/doc/index.html'
license=('GPL2')
makedepends=(
    'yade'
    # for make doc
    'python-sphinx'
    'python-bibtexparser'
    'python-ipython-genutils'
    'texlive-bin'
    'texlive-core'
    'texlive-latexextra'
    'texlive-pictures'
    # for  manpage
    'help2man'
    'openssh'
    'fmt' 'cmake'    'tk'
)
source=("trunk-${pkgver}.tar.gz::https://gitlab.com/yade-dev/trunk/-/archive/${pkgver}/trunk-${pkgver}.tar.gz"
"${pkgname}.patch"
)
sha512sums=('d93247bf86f9aa711b27b4258b711d5be448c8bffb78df8bc3a0691bb0d986ffe876a47a70eed43b1729b496ffd892f4d1137a397bc038539e95b695173da53c'
            'ffd3b27b8ccb9c6a8adaa7858d01b74b2fcbda64e6d1673b11cc33dc52a278b0ba4fd558352d15366f52023a6053c055546b5c8febccce1d1439cf6b5a3a755d')

prepare(){
    # Follow https://yade-dem.org/doc/installation.html#compilation
    test -d trunk && rm -rf trunk
    mv trunk-${pkgver} trunk
    test -d build || mkdir build
    cd trunk
    patch --strip=1 < ../${pkgname}.patch
}

package(){
    cd "$srcdir"/build
    install -d ${pkgdir}/usr/share/doc/${pkgbase}
    install -d ${pkgdir}/usr/share/man/man1
    cmake ../trunk \
        -DCMAKE_INSTALL_PREFIX=/usr -DNOSUFFIX=ON \
        -DYADE_DOC_PATH=${pkgdir}/usr/share/doc/${pkgbase} \
        -DYADE_MAN_PATH=${pkgdir}/usr/share/man/man1/
    make doc
    make manpage
}
