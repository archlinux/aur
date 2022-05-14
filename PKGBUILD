# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade-doc
pkgver=2022.01a
pkgrel=4
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling Documentation"
arch=("x86_64")
url='https://yade-dem.org/doc/index.html'
license=('GPL2')
makedepends=( 
    'yade'
    # for make doc 
    'python-sphinx'
    'python-bibtexparser'
    'texlive-bin'
    # for  manpage
    'help2man'
)
source=("trunk-${pkgver}::git+https://gitlab.com/yade-dev/trunk.git?commit=fd04d864622a1c628296ccd1697efc93cda98c27"
"${pkgname}.patch"
)
sha512sums=('SKIP'
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
    mkdir -p ${pkgdir}/usr/share/doc/${pkgbase}
    mkdir -p ${pkgdir}/usr/share/man/
    cmake ../trunk \
        -DCMAKE_INSTALL_PREFIX=/usr -DNOSUFFIX=ON \
        -DYADE_DOC_PATH=${pkgdir}/usr/share/doc/${pkgbase} \
        -DYADE_MAN_PATH=${pkgdir}/usr/share/man1/
    make doc
    make manpage
}
