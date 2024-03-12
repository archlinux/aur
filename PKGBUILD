# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgbase=reactphysics3d
pkgname=(reactphysics3d reactphysics3d-docs)
pkgver=0.10.0
pkgrel=1
pkgdesc='Physics engine'
arch=(x86_64)
url='https://www.reactphysics3d.com'
license=(Zlib)
makedepends=(cmake ninja)
source=("$url/documentation/manual/ReactPhysics3D-UserManual.pdf"
        "https://github.com/DanielChappuis/reactphysics3d/releases/download/v$pkgver/reactphysics3d-$pkgver.tar.gz"
        $pkgbase.pc)
b2sums=('e4c03217bf04189b2ecd225af8e1d0b089c61135afbd32d207645936c6adf9902b6390a7da5c19d88945e134b2864f69c7bc96ab12897dc11235cb1906b5a02f'
        '4aa5807b7f6d4a310c38e6aa315a778822fa54c5e7ebdde7c82a68458b6123b7e33c827d1587b9ccc87c82cca3f8620eab23e2139f15344b87e56f1fe8a25603'
        '05a7ffbe133de300240946ea601cf04df8fa54c8fab26ff087979c76416158c12d3d744055aa784cbc39820a31b534114bdf879380abdae819adea42b5844317')

prepare() {
  find $pkgbase -name .DS_Store -delete
}

build() {
  cmake \
    -B build \
    -D BUILD_SHARED_LIBS=ON \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -w" \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D RP3D_DOUBLE_PRECISION_ENABLED=ON \
    -D RP3D_COMPILE_TESTS=OFF \
    -G Ninja \
    -S $pkgbase
  ninja -C build
}

package_reactphysics3d() {
  depends=(gcc-libs)

  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 $pkgbase.pc \
    "$pkgdir/usr/lib/pkgconfig/$pkgbase.pc"
  install -Dm644 $pkgbase/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_reactphysics3d-docs() {
  pkgdesc='Physics engine (user manual)'

  install -Dm644 ReactPhysics3D-UserManual.pdf \
    "$pkgdir/usr/share/doc/$pkgname/UserManual.pdf"
  install -Dm644 $pkgbase/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
