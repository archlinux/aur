# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgbase=reactphysics3d
pkgname=(reactphysics3d reactphysics3d-docs)
pkgver=0.9.0
pkgrel=1
pkgdesc='Physics engine'
arch=(x86_64)
url='https://www.reactphysics3d.com'
license=(ZLIB)
makedepends=(cmake ninja)
source=("https://github.com/DanielChappuis/reactphysics3d/releases/download/v$pkgver/reactphysics3d-$pkgver.tar.gz"
        "https://www.reactphysics3d.com/documentation/manual/ReactPhysics3D-UserManual.pdf"
        $pkgbase.pc)
b2sums=('b181f4a4a79d471e04316f84eef3aeefb685c5d1f7ba9eaa8428b04e9da04423848fac9fc668b2a0bc8e931674dd42758817fe929b282a3a9052919f44c81e35'
        '5f5bc9304b6fc0a7d3e87c2c500ddd9102cf121b91262f37e8ff9843ef22ca6d7621672cd839d18772042a85e0ff4f4cd90d05bf682f851f1ece6838fd78001a'
        '05a7ffbe133de300240946ea601cf04df8fa54c8fab26ff087979c76416158c12d3d744055aa784cbc39820a31b534114bdf879380abdae819adea42b5844317')

prepare() {
  find $pkgbase -name .DS_Store
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

# getver: github.com/DanielChappuis/reactphysics3d/releases
