# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=videodownloader
_reponame=videodownloader
pkgname=mingw-w64-videodownloader
pkgver=1.3.1
pkgrel=1
arch=('any')
pkgdesc="A video downloader with Qt GUI (currently only YouTube and Vimeo are maintained, git version)."
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qtutilities' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ffmpeg')
url="https://github.com/Martchus/${_reponame}"
source=("videodownloader-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('122a64f4d08caa2e1cca1dd279d4db85023d46ee9f12b041b341b8d7c33dea9d')
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
    make DESTDIR="${pkgdir}" install-mingw-w64-strip install-json-res
    popd
  done
}
