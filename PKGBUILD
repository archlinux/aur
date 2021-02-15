# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.19.5
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="https://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info' 'jsoncpp' 'libjsoncpp.so' 'libuv' 'rhash')
makedepends=('qt5-base' 'python-sphinx' 'emacs')
optdepends=('qt5-base: cmake-gui')
source=("https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
         cmake-cppflags.patch)
sha512sums=('de8645c7c03bd48987f6eefc19bc2856c2a939e537cf204e1c9749d5a3e21c71695080bee246e94871f82996ede9d1a8771972266434549b48df9924fbb4c6f2'
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
