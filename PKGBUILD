# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=passwordfile
_reponame=passwordfile
pkgname=mingw-w64-passwordfile
pkgver=3.1.1
pkgrel=1
arch=('any')
pkgdesc="C++ library to read/write passwords from/to encrypted files (using AES-256-CBC via OpenSSL, mingw-w64)."
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-c++utilities' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
url="https://github.com/Martchus/${_reponame}"
source=("passwordfile-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('46068f8e0d789d2a516950f201275eddf3720bc67d941730e00c1efb100e6dc4')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  # build utilities for each architecture
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" ../
    make
    popd
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install-mingw-w64-strip
    popd
  done
}
