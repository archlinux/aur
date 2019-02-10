# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=kim-api
pkgver=2.0.0
pkgrel=1
pkgdesc="Online framework for reliable, reproducible and portable molecular simulations"
arch=("i686" "x86_64")
url="https://openkim.org"
license=('CDDL')
depends=(bash)
makedepends=(gcc-libs)
install=$pkgname.install
source=(https://s3.openkim.org/kim-api/kim-api-v2-2.0.0.txz
	Fix-Doxygen-command-error.patch)
sha512sums=('709f7ba26e9ab2a6b55636989fb891e64fada4123fc20c55b69a5555a21a00105053abd3826e0a317856a0ec07c79369a68b185a204fe145ca8d94c455afa5b4'
            'e2771561f05b49b7ed46b265af6a2c81ad8fbde9e6ab9f2632822764de5802ac0e91973e66d5240136ea7e9a8b82befc312dbbb3bccdb84d8875744851fcb146')

prepare() {
  cd "$pkgname-v2-$pkgver"
  patch -p1 -i ../Fix-Doxygen-command-error.patch
  cd ..
  mkdir -p build
}

build() {
  cd build
  cmake "../$pkgname-v2-$pkgver" \
  	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DCMAKE_INSTALL_LIBEXECDIR="/usr/lib" \
	-DKIM_API_BUILD_EXAMPLES=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  # remove empty directories
  cd "$pkgdir"
  rm -rf usr/share
}
