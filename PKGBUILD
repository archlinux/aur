# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.16.4
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="https://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info' 'jsoncpp' 'libjsoncpp.so' 'libuv' 'rhash')
makedepends=('qt5-base' 'python-sphinx' 'emacs')
optdepends=('qt5-base: cmake-gui')
source=("https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4aa36608bac3b9e29ea765003cdc684733c025d7b18fbae057f3be1f726a159d4b0231b8b1be269206aa7dbd7177fe0110d5bac8d72fb0f6ad392bb284b1fce3')

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
