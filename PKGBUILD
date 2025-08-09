# maintainer: bipin <kbipinkumar@pm.me>
pkgname=libgff
pkgver=2.0.0
pkgrel=3
pkgdesc="GFF/GTF parsing from gffread as a library"
arch=(x86_64)
url="https://github.com/COMBINE-lab/libgff"
license=('BSL-1.0')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/COMBINE-lab/libgff/archive/refs/tags/v${pkgver}.tar.gz"
    'libgff-dynamic-build-corrected.patch')
sha256sums=('7656b19459a7ca7d2fd0fcec4f2e0fd0deec1b4f39c703a114e8f4c22d82a99c'
            'e97af693ac84a70fcf3a513063f3eb413406e7ef7e808bf12caa2f38476f713f')

prepare() {
  cd $pkgname-$pkgver
  # Build ligff as shared library.
  patch -p1 < ${srcdir}/libgff-dynamic-build-corrected.patch
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
