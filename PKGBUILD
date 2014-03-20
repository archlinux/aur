# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=2.8.12.2
pkgrel=2
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt4' 'emacs')
optdepends=('qt4: cmake-gui')
install="${pkgname}.install"
source=("http://www.cmake.org/files/v2.8/${pkgname}-${pkgver}.tar.gz"
        "findfreetype.patch"
        "FindPython-Interp-Libs-Search-for-Python-3.4.patch")
md5sums=('17c6513483d23590cbce6957ec6d1e66'
         '90321de1d9d46cd8d6609d0509dbd7b0'
         '5e036a37f9b0b3368b8cfcc5784d1514')

build() {
  cd ${pkgname}-${pkgver}

  patch -Np1 < ${srcdir}/findfreetype.patch
  patch -Np1 < ${srcdir}/FindPython-Interp-Libs-Search-for-Python-3.4.patch

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 Docs/cmake-indent.vim "${vimpath}"/indent/cmake-indent.vim
  install -Dm644 Docs/cmake-syntax.vim "${vimpath}"/syntax/cmake-syntax.vim

  install -Dm644 Docs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
