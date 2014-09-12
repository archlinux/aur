# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.0.2
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt5-base' 'python-sphinx' 'emacs')
optdepends=('qt5-base: cmake-gui'
            'libxkbcommon-x11: cmake-gui')
install="${pkgname}.install"
source=("http://www.cmake.org/files/v3.0/${pkgname}-${pkgver}.tar.gz")
md5sums=('db4c687a31444a929d2fdc36c4dfb95f')

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
  install -d "${vimpath}"/{help,indent,syntax}
  ln -s /usr/share/cmake-3.0/editors/vim/cmake-help.vim "${vimpath}"/help/
  ln -s /usr/share/cmake-3.0/editors/vim/cmake-indent.vim "${vimpath}"/indent/
  ln -s /usr/share/cmake-3.0/editors/vim/cmake-syntax.vim "${vimpath}"/syntax/

  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/cmake-3.0/editors/emacs/cmake-mode.el
  ln -s /usr/share/cmake-3.0/editors/emacs/cmake-mode.el "${pkgdir}"/usr/share/emacs/site-lisp/

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
