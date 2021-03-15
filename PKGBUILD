# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.19.7
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
sha512sums=('6af1fe3ea41906324d4c29f5f982281d92145d086f4a47fa2220b93483bc65d59b1e23f5b51d82305c630690be7c552827bb795560674b03620763e0917bf14a'
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
