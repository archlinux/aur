# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

_pkgname=doxygen
pkgname=doxygen-clang
pkgver=1.9.7
pkgrel=1
pkgdesc='Documentation system for C++, C, Java, IDL and PHP (built with clang parser)'
url='http://www.doxygen.nl'
arch=('x86_64')
license=('GPL')
depends=('gcc-libs' 'clang')
optdepends=('graphviz: for caller/callee graph generation'
            'qt5-base: for doxywizard')
makedepends=('cmake' 'gcc-libs' 'flex' 'qt5-base' 'ghostscript'
             'texlive-latexextra' 'texlive-fontutils' 'texlive-fontsrecommended' 'texlive-plaingeneric'
             'graphviz' 'python' 'git')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/doxygen/doxygen/archive/Release_${pkgver//./_}.tar.gz)
sha256sums=('691777992a7240ed1f822a5c2ff2c4273b57c1cf9fc143553d87f91a0c5970ee')
sha512sums=('2986ea60f9b683d92d81083af74ed17cffa283b9893f61c1d8d62a9d7f0daa8b16057e952163046c96aa9b26a83f8fd55d27b124a3d65f0129acd18866fdb8be')
b2sums=('69f30fc701e55c9cca0a14da141acbc16403c7c35bb60720415e5851c16ea2ee68bca90a6d88c9b14b98d794c80dc93d2c9e085a8dcd4fd9e6f8111544ce678e')

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
