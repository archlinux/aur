# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

_pkgname=doxygen
pkgname=doxygen-clang
pkgver=1.9.8
pkgrel=1
pkgdesc='Documentation system for C++, C, Java, IDL and PHP (built with clang parser)'
url='http://www.doxygen.nl'
arch=('x86_64')
license=('GPL')
depends=('gcc-libs' 'clang' 'llvm')
optdepends=('graphviz: for caller/callee graph generation'
            'qt5-base: for doxywizard')
makedepends=('cmake' 'gcc-libs' 'flex' 'qt5-base' 'ghostscript'
             'texlive-latexextra' 'texlive-fontutils' 'texlive-fontsrecommended' 'texlive-plaingeneric'
             'graphviz' 'python' 'git')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/doxygen/doxygen/archive/Release_${pkgver//./_}.tar.gz)
sha256sums=('77371e8a58d22d5e03c52729844d1043e9cbf8d0005ec5112ffa4c8f509ddde8')
sha512sums=('028788a4c4daba895d5c4b20ad99a7bfe61aa9ddd39dfa220eafc3f56563881ad682fa528ebfb49ac04493f974cb0b503f9b0e7edd7ff860c3b2d2991d25705d')
b2sums=('4ff9264374db959936105301097d02d25c1cf57aabf336350767b97ae73c4f8d94f2f954b1baae2166fc29a5056f67fb4e6cbb6baa8a0c42cbbf51e631b3a9a8')

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
  export CAIRO_DEBUG_PDF=1 # https://github.com/doxygen/doxygen/issues/9319
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

# vim: ts=2 sw=2 et:
