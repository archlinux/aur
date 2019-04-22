# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.14.3
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info' 'jsoncpp' 'libuv' 'rhash')
makedepends=('qt5-base' 'python-sphinx' 'emacs')
optdepends=('qt5-base: cmake-gui'
            'libxkbcommon-x11: cmake-gui')
source=("https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e257a96334f21f2b2f17e8d43aa32c2b069d13194604393c5ac9d3da193000d5328181c6cf861696186d022aba57679ee2d08073d8a7112727746b2b145a47e2')

build() {
  cd ${pkgname}-${pkgver}

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --sphinx-man \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${vimpath}"/{indent,syntax}
  ln -s /usr/share/cmake-${pkgver%.*}/editors/vim/indent/cmake.vim \
    "${vimpath}"/indent/
  ln -s /usr/share/cmake-${pkgver%.*}/editors/vim/syntax/cmake.vim \
    "${vimpath}"/syntax/

  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  emacs -batch -f batch-byte-compile \
    "${pkgdir}"/usr/share/cmake-${pkgver%.*}/editors/emacs/cmake-mode.el
  ln -s /usr/share/cmake-${pkgver%.*}/editors/emacs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/
  ln -s /usr/share/cmake-${pkgver%.*}/editors/emacs/cmake-mode.elc \
    "${pkgdir}"/usr/share/emacs/site-lisp/

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
