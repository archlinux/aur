# Maintainer: Martchus <martchus@gmx.net>
_name=tageditor
_reponame=tageditor
pkgname=mingw-w64-tageditor
pkgver=1.3.0
pkgrel=1
arch=('any')
pkgdesc="A tageditor with Qt GUI and command line interface supporting MP4 (iTunes), ID3, Vorbis and Matroska (mingw-w64)."
license=('GPL')
depends=(mingw-w64-{crt,qt5-script,qt5-webkit,qtutilities,tagparser})
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ffmpeg')
url="https://github.com/Martchus/${_reponame}"
source=("tageditor-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('6b050fe5281b0be7dba02783e86dfb93c781c8271be949e81371113905db1312')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  # build utilities for each architecture
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/${_arch}" ../
    make
    popd
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make install-mingw-w64-strip
    popd
  done
}
