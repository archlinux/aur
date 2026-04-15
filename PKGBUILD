# maintainer: bipin <kbipinkumar@pm.me>
pkgname=libgff
pkgver=2.0.1
pkgrel=3
pkgdesc="GFF/GTF parsing from gffread as a library"
arch=(x86_64)
url="https://github.com/COMBINE-lab/libgff"
license=('BSL-1.0')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/COMBINE-lab/libgff/archive/refs/tags/v${pkgver}.tar.gz"
    'libgff-dynamic-build-corrected.patch')
sha256sums=('96d2bda64aaf9cf7b6c1a42205e408b0ef2a353ba42dad560db215e7ec105e2e'
            'e97af693ac84a70fcf3a513063f3eb413406e7ef7e808bf12caa2f38476f713f')

prepare() {
  cd $pkgname-$pkgver
  # Build ligff as shared library.
  patch -p1 < ${srcdir}/libgff-dynamic-build-corrected.patch
  sed -i "s/set(LIB_GFF_VERSION [0-9.]*)/set(LIB_GFF_VERSION $pkgver)/" libgffConfig.cmake.in

  # Also update version in CMakeLists.txt
  sed -i "s/set(ver_major [0-9]*)/set(ver_major ${pkgver%%.*})/" CMakeLists.txt
  sed -i "s/set(ver_minor [0-9]*)/set(ver_minor $(echo $pkgver | cut -d. -f2))/" CMakeLists.txt
  sed -i "s/set(ver_patch [0-9]*)/set(ver_patch ${pkgver##*.})/" CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev \
    -DCMAKE_SKIP_INSTALL_RPATH=YES

   MAKEFLAGS=-j1 cmake --build build

}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
