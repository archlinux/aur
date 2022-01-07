# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

_pkgname=doxygen
pkgname=doxygen-clang
pkgver=1.9.3
pkgrel=1
pkgdesc='Documentation system for C++, C, Java, IDL and PHP (built with clang parser)'
url='http://www.doxygen.nl'
arch=('x86_64')
license=('GPL')
depends=('gcc-libs' 'clang')
optdepends=('graphviz: for caller/callee graph generation'
            'qt5-base: for doxywizard')
makedepends=('cmake' 'gcc-libs' 'flex' 'qt5-base' 'texlive-core' 'ghostscript'
             'texlive-latexextra' 'graphviz' 'python' 'git' 'llvm')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/doxygen/doxygen/archive/Release_${pkgver//./_}.tar.gz)
sha256sums=('c29426222c9361dc33b762cf1c6447c78cfb0b9c213e5dcdbe31a10540c918c5')
sha512sums=('8fcec24d7f92c0d01444cb4b64a39adbe3467b7d75bf191ab667190d4feb1c99ac796fc5b1be6ae5f386321e3d85f28d4cbee05041f048f32ef68ea773d74ff9')
b2sums=('81451704cdf1676db58ad7706c06bc5587f8fdcd8e10b17d0909c1a288c6d92d6080334544b7c7ae88e1fe459511e9f2da8781672e9856c03e4c553f5c1f1e49')

provides=(${_pkgname} ${_pkgname}-docs)
conflicts=(${_pkgname} ${_pkgname}-docs)

prepare() {
  cd ${_pkgname}-Release_${pkgver//./_}
  # Install the man pages in the right place
  sed -i 's:DESTINATION man/man1:DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1":g' \
    doc/CMakeLists.txt
}

build() {
  cd ${_pkgname}-Release_${pkgver//./_}

  cmake -B build \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DDOC_INSTALL_DIR:PATH=share/doc/doxygen \
    -DPYTHON_EXECUTABLE:FILE=/usr/bin/python \
    -Dbuild_doc:BOOL=ON \
    -Dbuild_wizard:BOOL=ON \
    -Duse_libclang:BOOL=ON
  make -C build
  make -C build docs -j1
}

check() {
  cd ${_pkgname}-Release_${pkgver//./_}
  make -C build tests
}

package() {
  cd ${_pkgname}-Release_${pkgver//./_}
  make -C build DESTDIR="${pkgdir}" install
}
