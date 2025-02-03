# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgbase=reactphysics3d
pkgname=(reactphysics3d reactphysics3d-docs)
pkgver=0.10.2
pkgrel=1
pkgdesc='Physics engine'
arch=(x86_64)
url='https://www.reactphysics3d.com'
license=(Zlib)
makedepends=(cmake doxygen git)
source=("git+https://github.com/DanielChappuis/reactphysics3d#tag=v$pkgver"
        $pkgbase.pc)
b2sums=('83de412abf2d46eb9334697399de9238fecb89b0171c7b29e372d440776cedfb440c8f670711e2841b1194937d85640b29842774187fb04dc9a38dcee4d3feda'
        '05a7ffbe133de300240946ea601cf04df8fa54c8fab26ff087979c76416158c12d3d744055aa784cbc39820a31b534114bdf879380abdae819adea42b5844317')

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
    -D RP3D_GENERATE_DOCUMENTATION=ON \
    -S $pkgbase
  make -C build
}

package_reactphysics3d() {
  depends=(gcc-libs)

  DESTDIR="$pkgdir" make -C build install
  install -Dm644 $pkgbase.pc \
    "$pkgdir/usr/lib/pkgconfig/$pkgbase.pc"
  install -Dm644 $pkgbase/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_reactphysics3d-docs() {
  pkgdesc='Physics engine (documentation)'

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r build/documentation/html/* "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 $pkgbase/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
