# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade-doc
pkgver=2024.08a
pkgrel=1
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling Documentation"
arch=("any")
url='https://yade-dem.org/doc/index.html'
license=('GPL-2.0-or-later')
makedepends=(
    'yade'
    # for make doc
    'python-sphinx'
    'python-bibtexparser'
    'python-ipython-genutils'
    'python-pickleshare'
    'texlive-bin'
    'texlive-core'
    'texlive-latexextra'
    'texlive-pictures'
    'texlive-xetex'
    'texlive-fontsrecommended'
    'texlive-langgreek' # need puenc-greek.def
    # for  manpage
    'help2man'
    'openssh'
    'fmt' 'cmake' 'tk'
    'cuda'
)
source=("trunk-${pkgver}.tar.gz::https://gitlab.com/yade-dev/trunk/-/archive/${pkgver}/trunk-${pkgver}.tar.gz"
    "${pkgname}.patch"
)
sha512sums=('081f4c228959a92830b9d2d2fde50bc717f6932e8da051051093693ef7cedea6d87100ef02a6e72c74259d08e821065400c91002be5eea1d27afbcba8cd72df2'
    'ffd3b27b8ccb9c6a8adaa7858d01b74b2fcbda64e6d1673b11cc33dc52a278b0ba4fd558352d15366f52023a6053c055546b5c8febccce1d1439cf6b5a3a755d')

prepare() {
    # Follow https://yade-dem.org/doc/installation.html#compilation
    mv trunk-${pkgver} trunk
    install -d build
    cd trunk
    patch --strip=1 <../${pkgname}.patch
}

package() {
    cd "$srcdir"/build
    # fmtutil-user --all
    install -d ${pkgdir}/usr/share/doc/${pkgbase}
    install -d ${pkgdir}/usr/share/man/man1
    cmake ../trunk \
        -DCMAKE_INSTALL_PREFIX=/usr -DNOSUFFIX=ON \
        -DYADE_DOC_PATH=${pkgdir}/usr/share/doc/${pkgbase} \
        -DYADE_MAN_PATH=${pkgdir}/usr/share/man/man1/
    make doc
    make manpage
}
