# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgbase=reactphysics3d
pkgname=(reactphysics3d reactphysics3d-docs)
pkgver=0.8.0
pkgrel=2
pkgdesc='Physics engine'
arch=(x86_64)
url='https://www.reactphysics3d.com'
license=(ZLIB)
makedepends=(cmake ninja)
source=("https://github.com/DanielChappuis/reactphysics3d/releases/download/v$pkgver/reactphysics3d-$pkgver.tar.gz"
        "https://www.reactphysics3d.com/documentation/manual/ReactPhysics3D-UserManual.pdf"
        "$pkgbase.pc")
sha256sums=('a58c6e88311e2d7da6ae60f486097e1fe522682cd84b0f93e0f97d39377571cb'
            '4bd8e9cfd6459718592300eb748d90644958ea8e8aee3ea7a3fa5c67bf22010f'
            '38c8e276bc0601434f27e161036f310d40a28bef527dddabf5140375bf5bb712')

prepare() {
  find "$srcdir/$pkgbase" -name .DS_Store -delete
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$pkgbase" \
    -D BUILD_SHARED_LIBS=ON \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -w" \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D RP3D_DOUBLE_PRECISION_ENABLED=ON \
    -D RP3D_COMPILE_TESTS=OFF \
    -G Ninja
  ninja
}

package_reactphysics3d() {
  depends=(gcc-libs)
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 "$pkgbase.pc" \
    "$pkgdir/usr/lib/pkgconfig/$pkgbase.pc"
  install -Dm 644 "$pkgbase/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_reactphysics3d-docs() {
  pkgdesc='Physics engine (user manual)'
  install -Dm 644 "ReactPhysics3D-UserManual.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/UserManual.pdf"
  install -Dm 644 "$pkgbase/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/DanielChappuis/reactphysics3d/releases
