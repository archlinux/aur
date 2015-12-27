# Maintainer: Martchus <martchus@gmx.net>
_name=videodownloader
_reponame=videodownloader
pkgname=mingw-w64-videodownloader
pkgver=1.3.0
pkgrel=1
arch=('any')
pkgdesc="A video downloader with Qt GUI (currently only YouTube and Vimeo are maintained, git version)."
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qtutilities' 'mingw-w64-openssl')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-qt5-tools' 'ffmpeg')
url="https://github.com/Martchus/${_reponame}"
source=("videodownloader-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('0680db3887715f6147247d2344745794fac6d6d57daf0173c8e2ac29b5392e30')
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
