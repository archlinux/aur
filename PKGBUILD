# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=tagparser
_reponame=tagparser
pkgname=$_name-doc
pkgver=12.5.2
pkgrel=1
arch=('any')
pkgdesc='C++ library for reading and writing MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska tags (API documentation)'
license=(GPL-2.0-or-later)
makedepends=('cmake' 'ninja' 'iso-codes' 'doxygen' 'graphviz' 'c++utilities')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('eb9a8e1f736f053fe44632bfc45906f1e4f76fecf01a406fc4d570165d2101f9')

prepare() {
  [[ -d tagparser ]] || ln -s "${PROJECT_DIR_NAME:-$_reponame-$pkgver}" tagparser
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    .
  ninja ${_name}_apidoc
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install-api-doc
}
