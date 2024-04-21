# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=castxml
pkgdesc="C-family abstract syntax tree XML output tool."
pkgver=0.6.5
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/CastXML/CastXML"
license=(Apache)
depends=(llvm clang)
makedepends=(cmake python-sphinx)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CastXML/CastXML/archive/v${pkgver}.tar.gz")
sha256sums=('fea4754bdb1fb4496fec12352e2bd07854843aa757e85d0553f224ff0111c482')

prepare() {
  cd "CastXML-${pkgver}"

  # Fix build issue as reported by Kniyl here https://github.com/CastXML/CastXML/issues/102
  sed -i "s|\${llvm_libs}|LLVM|g" src/CMakeLists.txt
}

build() {
  cmake -B build -S "CastXML-${pkgver}" -Wno-dev \
    -DCLANG_LINK_CLANG_DYLIB=1 \
    -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build \
    -DSPHINX_HTML=1 \
    -DSPHINX_MAN=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCastXML_INSTALL_DOC_DIR=share/doc/castxml \
    -DCastXML_INSTALL_MAN_DIR=share/man

  cmake --build build
}

package(){
  DESTDIR="${pkgdir}" cmake --install build
}
