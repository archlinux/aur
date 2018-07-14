# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.11.4
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
        libuv-fix.patch::https://gitlab.kitware.com/cmake/cmake/commit/2c36dabbeef72e2d9c9697e6dcc5c67fd0a912dd.diff)
sha512sums=('c5d03ad66a004292038e49e391c390ebc328fbb089ea699742a9b75f0ada9398c3dc971b868f75d8438bf437ecbeaa62541beb53cae14a699bf244ad101a2290'
            '5f9989af4f1af1d258579741285408ed6732dd694db17982e7e7c989c33490bf5c1351e2e3e725f14437ae6a86266d21ff799caf91593fccb2bfb2144affc3d9')

prepare() {
  cd $pkgname-$pkgver
  # FS#59268
  patch -p1 -i ../libuv-fix.patch
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
