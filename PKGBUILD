# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=passwordmanager
_reponame=passwordmanager
pkgname=mingw-w64-passwordmanager
pkgver=2.1.1
pkgrel=2
arch=('any')
pkgdesc="A simple password store using AES-256-CBC encryption via OpenSSL (mingw-w64)."
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-qtutilities' 'mingw-w64-passwordfile' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ffmpeg')
url="https://github.com/Martchus/${_reponame}"
source=("passwordmanager-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('ad2b91f2b1a54668d06c258686ec48f41f3ffd34cbbcd1ec4bb2a3226e3a9b4b')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  # build utilities for each architecture
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" -DQUICK_GUI="no" ../
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
