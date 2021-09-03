# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

_pkgname=doxygen
pkgname=doxygen-clang
pkgver=1.9.2
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
sha256sums=('40f429241027ea60f978f730229d22e971786172fdb4dc74db6406e7f6c034b3')
sha512sums=('fa5d8d54ee9d560e0f5b9a799430cd79fe715bf6c8084c0c6b60e512f7cc23c9ff5b4a8fb9a750dc272ce1a20cac52087953749c432824af67131407922e066d')
b2sums=('3ac304324190161cf6fb841d7ead946956769d8931687d388bc9de282cf42b02167136d0c396f7f0e863c4c5414b624d6bec58a8630ec1b857660b9dbf517046')

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
