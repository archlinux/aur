# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

_pkgname=doxygen
pkgname=doxygen-clang
pkgver=1.10.0
pkgrel=1
pkgdesc='Documentation system for C++, C, Java, IDL and PHP (built with clang parser)'
url='http://www.doxygen.nl'
arch=('x86_64')
license=('GPL')
depends=('gcc-libs' 'clang' 'llvm')
optdepends=('graphviz: for caller/callee graph generation'
            'qt5-base: for doxywizard')
makedepends=('cmake' 'gcc-libs' 'flex' 'qt6-base' 'ghostscript'
             'texlive-latexextra' 'texlive-fontutils' 'texlive-fontsrecommended' 'texlive-plaingeneric'
             'graphviz' 'python')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/doxygen/doxygen/archive/Release_${pkgver//./_}.tar.gz)
sha256sums=('795692a53136ca9bb9a6cd72656968af7858a78be7d6d011e12ab1dce6b9533c')
sha512sums=('d8731796d5513ff5939c234f32f7f31aabc45f5557947741a330b3d33b368fb5ad770ef1d3d7384a402d98229eafeb1f955ef76e9932310b83c1d35a2eef500f')
b2sums=('e9eaf70e106aa022bb0edc99082e6bccd5c6879c41be40ce69d2d5e4eb7d1c5ff078fd8f9132206bf546fa78aab7f8bef4584fd1f2d6e1e84b01d2e65933375e')

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
