# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.10.2
pkgrel=2
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info' 'jsoncpp' 'libuv' 'rhash')
makedepends=('qt5-base' 'python-sphinx' 'emacs')
optdepends=('qt5-base: cmake-gui'
            'libxkbcommon-x11: cmake-gui')
source=("https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
        'cmake-3.10-boost-1.66-support.patch')
sha512sums=('f58fdd025285c9ff5396c0bd0d9573fc8a498fcbe5c11b336cb8ad6154ca6bc875c1a5e22d6654ba98596791ecf89ae8adffb83450839fa1275756b0af5bf82b'
            'edc24a0e057056427e15b0b4c23828c8d0d23a69061d0ede9ae1bb6104bece53157480f63361b48994ea9f3b12f5bcd9f1d56c4f7d5c4b1b88c8e1a7b6ee5b68')

prepare() {
 cd ${pkgname}-${pkgver}  
 patch -p1 -i "${srcdir}/cmake-3.10-boost-1.66-support.patch"
}

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
  ln -s /usr/share/cmake-${pkgver%.*}/editors/vim/indent/cmake.vim \
    "${vimpath}"/indent/
  ln -s /usr/share/cmake-${pkgver%.*}/editors/vim/syntax/cmake.vim \
    "${vimpath}"/syntax/

  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  emacs -batch -f batch-byte-compile \
    "${pkgdir}"/usr/share/cmake-${pkgver%.*}/editors/emacs/cmake-mode.el
  ln -s /usr/share/cmake-${pkgver%.*}/editors/emacs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
