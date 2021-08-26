# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.21.2
pkgrel=2
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="https://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'hicolor-icon-theme' 'jsoncpp' 'libjsoncpp.so' 'libuv' 'rhash')
makedepends=('qt6-base' 'python-sphinx' 'emacs')
optdepends=('qt6-base: cmake-gui')
source=("https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
         cmake-cppflags.patch)
sha512sums=('75649404564aaa6175a8c66ab19a10318066dbb667806c287e3cb125ac4c16c1629c160e355bcc50864a38d5488b1f7d1bc77acc602f5f3edd5f68691ae5080d'
            '407c5c63a31266e44641ada8229dbc33df44df98e5bb575db3a33590e8ffdff9aea3f2ee5cb0cb855858facf1e46c63886dea9f948a0cad2da042e7f7f258cac')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../cmake-cppflags.patch # Honor CPPFLAGS https://gitlab.kitware.com/cmake/cmake/issues/12928
}

build() {
  cd ${pkgname}-${pkgver}
  export CXXFLAGS+=" ${CPPFLAGS}"
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

  emacs -batch -f batch-byte-compile \
    "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
