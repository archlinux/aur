# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

_pkgname=doxygen
pkgname=doxygen-clang
pkgver=1.9.1
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
sha256sums=('96db0b69cd62be1a06b0efe16b6408310e5bd4cd5cb5495b77f29c84c7ccf7d7')
sha512sums=('1b835701f3d76a968442ac3912842c7ee3e24bbce89517bef9c81ff54c4866f35bf693ad6dd235519adffdb5f0bfe418956ddc096edddc1c53c0d3030a86c1e7')
b2sums=('811d6a53765abd26e0d00c15b986abdbf559723cb5399bbdfb292f6d822590579d7ca5c9869ce383eb99d2dcd1efefb954da1e190e4e4b0aa9752fadc4903474')

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
  make -C build docs
}

check() {
  cd ${_pkgname}-Release_${pkgver//./_}
  make -C build tests
}

package() {
  cd ${_pkgname}-Release_${pkgver//./_}
  make -C build DESTDIR="${pkgdir}" install
}
