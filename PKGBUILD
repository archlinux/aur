# Maintainer:
# Contributor: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Filipe Verri <filipeverri@gmail.com>

pkgname=build2
pkgver=0.17.0
pkgrel=1
pkgdesc='build2 build system'
arch=(x86_64)
url='https://build2.org/'
license=(MIT)
makedepends=(chrpath)
depends=(gcc-libs
         glibc
         sqlite)
source=(https://download.build2.org/$pkgver/build2-toolchain-$pkgver.tar.xz)
sha256sums=('3722a89ea86df742539d0f91bb4429fd46bbf668553a350780a63411b648bf5d')

build() {
  mkdir -p build/usr
  cd build2-toolchain-$pkgver
  ./build.sh --trust yes --local --system libsqlite3 --install-dir "$srcdir"/build/usr ${CXX:-g++} $CXXFLAGS $LDFLAGS

  for f in "$srcdir"/build/usr/lib/pkgconfig/*.pc; do sed -i "s|$srcdir/build||" ${f}; done
}

package() {
  cp -av build/usr "$pkgdir"
  chrpath -d "$pkgdir"/usr/bin/{b,bpkg,bdep} "$pkgdir"/usr/lib/*.so

  install -Dm644 "$pkgdir"/usr/share/doc/build2/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
