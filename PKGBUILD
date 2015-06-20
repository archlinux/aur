# Maintainer: Felix Schindler
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
#
# This PKGBUILD is maintained at https://github.com/ftalbrecht/aur
# in the cmake2 branch

_pkgname=cmake
pkgname=${_pkgname}2
pkgver=2.8.12.2
pkgrel=1
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt4' 'emacs')
optdepends=('qt4: cmake-gui')
install="${pkgname}.install"
source=("http://www.cmake.org/files/v2.8/${_pkgname}-${pkgver}.tar.gz"
        "findfreetype.patch"
        "FindPython-Interp-Libs-Search-for-Python-3.4.patch")
md5sums=('17c6513483d23590cbce6957ec6d1e66'
         '90321de1d9d46cd8d6609d0509dbd7b0'
         '5e036a37f9b0b3368b8cfcc5784d1514')

build() {
  cd ${_pkgname}-${pkgver}

  patch -Np1 < ${srcdir}/findfreetype.patch
  patch -Np1 < ${srcdir}/FindPython-Interp-Libs-Search-for-Python-3.4.patch

  ./bootstrap --prefix=/opt/$pkgname \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  vimpath="${pkgdir}/opt/$pkgname/share/vim/vimfiles"
  install -Dm644 Docs/cmake-indent.vim "${vimpath}"/indent/cmake-indent.vim
  install -Dm644 Docs/cmake-syntax.vim "${vimpath}"/syntax/cmake-syntax.vim

  install -Dm644 Docs/cmake-mode.el \
    "${pkgdir}"/opt/$pkgname/share/emacs/site-lisp/cmake-mode.el
  emacs -batch -f batch-byte-compile "${pkgdir}"/opt/$pkgname/share/emacs/site-lisp/cmake-mode.el

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  install -d "${pkgdir}"/usr/bin
  for b in "${pkgdir}"/opt/$pkgname/bin/*; do
    ln -s /opt/$pkgname/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-2
  done
}
