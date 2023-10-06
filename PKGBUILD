# Maintainer:
# Contributor: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Filipe Verri <filipeverri@gmail.com>

pkgname=build2
pkgver=0.16.0
pkgrel=2
pkgdesc='build2 build system'
arch=(x86_64)
url='https://build2.org/'
license=(MIT)
makedepends=(chrpath)
depends=(gcc-libs
         glibc
         sqlite3)
source=(https://download.build2.org/$pkgver/build2-toolchain-$pkgver.tar.xz
        https://github.com/build2/libpkg-config/commit/c8978943.patch
        https://github.com/build2/libpkg-config/commit/604eb708.patch)
sha256sums=('23793f682a17b1d95c80bbd849244735ed59a3e27361529aa4865d2776ff8adc'
            '5b3fdcb4ec53c487aa005224ddbc6db02f078f01c1de530839cc8146026b6a7e'
            '29c2eeff019c6d8b0ffd1bfcf74a02aacf96a2d3dd6df24e2b0b2d0b76d93f00')

prepare() {
# Fix build with glibc 2.38
  patch -d build2-toolchain-$pkgver -p1 < c8978943.patch
  patch -d build2-toolchain-$pkgver -p1 < 604eb708.patch
}

build() {
  mkdir -p build/usr
  cd build2-toolchain-$pkgver
  ./build.sh --trust yes --local --system libsqlite3,libpkgconfig --install-dir "$srcdir"/build/usr ${CXX:-g++} $CXXFLAGS $LDFLAGS

  for f in "$srcdir"/build/usr/lib/pkgconfig/*.pc; do sed -i "s|$srcdir/build||" ${f}; done
}

package() {
  cp -av build/usr "$pkgdir"
  chrpath -d "$pkgdir"/usr/bin/{b,bpkg,bdep} "$pkgdir"/usr/lib/*.so

  install -Dm644 "$pkgdir"/usr/share/doc/build2/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
