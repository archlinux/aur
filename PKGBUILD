# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=kim-api
pkgver=2.1.2
pkgrel=1
pkgdesc="Online framework for reliable, reproducible and portable molecular simulations"
arch=("i686" "x86_64")
url="https://openkim.org"
license=('CDDL')
depends=(bash)
makedepends=(cmake gcc-libs)
install=$pkgname.install
source=(https://s3.openkim.org/kim-api/kim-api-2.1.2.txz
	Fix-Doxygen-command-error.patch)
sha512sums=('b00a2ca30d635967e2ea3b4c6419c725d18fb699c021810a74e05b438df4397e7739a40f85be2a5a545b4a0927ac29dfc040093886189b5baf54b1a89b691e3c'
            '0063cb18884a19d15261e910cc9877ff319f9c1b428023d736e34b5271f254a7eaca9b90033f80af560199e1fe363523da6afb4ee35a05af76b2760039a94cbd')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../Fix-Doxygen-command-error.patch
  cd ..
  mkdir -p build
}

build() {
  cd build
  cmake "../$pkgname-$pkgver" \
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
