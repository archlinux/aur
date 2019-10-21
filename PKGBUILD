# Maintainer: Bernhard Landauer <bernhard@manjaro.org>
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: yochananmarqos https://github.com/yochananmarqos

_pkgname=AppImageLauncher
pkgname=appimagelauncher
pkgver=2.0.2
pkgrel=1
pkgdesc="A Helper application for running and integrating AppImages."
arch=('x86_64')
url="https://github.com/TheAssassin/AppImageLauncher"
license=('MIT')
depends=('binutils'
    'boost'
    'cairo'
    'desktop-file-utils'
    'fuse'
    'gtest'
    'libarchive'
    'libbsd'
    'librsvg'
    'qt5-base'
    'shared-mime-info')
makedepends=('git' 'cmake' 'wget' 'vim' 'qt5-tools')
conflicts=('appimagelauncher-git')
source=("git+$url.git#tag=v$pkgver"
    'appimage-binfmt-remove.hook')
sha256sums=('SKIP'
            '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

prepare() {
  cd $_pkgname
  git submodule update --init --recursive
}

build() {
  cd $_pkgname
  cmake . \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr/ \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUSE_SYSTEM_GTEST=ON \
    -DUSE_SYSTEM_XZ=ON \
    -DUSE_SYSTEM_LIBARCHIVE=ON
  make
}

package() {
  install -Dm644 -t $pkgdir/usr/share/libalpm/hooks *.hook

  cd $_pkgname
  # re-run CMake to populate list of library files to bundle
  cmake .
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
