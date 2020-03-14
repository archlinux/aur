# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgbase=reactphysics3d
pkgname=(reactphysics3d reactphysics3d-docs)
pkgver=0.7.1
pkgrel=2
pkgdesc='Physics engine'
arch=(x86_64)
url='https://www.reactphysics3d.com'
license=(ZLIB)
makedepends=(cmake ninja)
source=("https://github.com/DanielChappuis/reactphysics3d/releases/download/v$pkgver/reactphysics3d-$pkgver.tar.gz"
        "https://www.reactphysics3d.com/documentation/manual/ReactPhysics3D-UserManual.pdf"
        "cmake.patch::https://github.com/DanielChappuis/reactphysics3d/commit/94076513166704edafd0567b438fa52c05569e25.patch")
sha256sums=('9e55cc79882120297974b331b81c55fa8e4a6802057e55c3922ed301dd83a20a'
            '7c6307724bfef92f351150d522fb1a9050400f404e0a3be231946d2b633cb1bd'
            'c3046803795f4072a6067a24bfb1af9927bc1c71866a570390e71f04bedcf376')

prepare() {
  # Prepare to build a shared library
  sed -i 's|ADD_LIBRARY(reactphysics3d|ADD_LIBRARY(reactphysics3d SHARED|g' \
    "$pkgbase-$pkgver/CMakeLists.txt"
  # Apply patch
  cd "$pkgbase-$pkgver"
  patch -p1 -i ../cmake.patch
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$pkgbase-$pkgver" \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -w" \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D RP3D_DOUBLE_PRECISION_ENABLED="True" \
    -G Ninja
  ninja
}

package_reactphysics3d() {
  depends=(gcc-libs)
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 "$pkgbase-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_reactphysics3d-docs() {
  #arch=(any)
  pkgdesc='Physics engine (user manual)'
  install -Dm 644 "ReactPhysics3D-UserManual.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/UserManual.pdf"
  install -Dm 644 "$pkgbase-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/DanielChappuis/reactphysics3d/releases
# vim: ts=2 sw=2 et:
