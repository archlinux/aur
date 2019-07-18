# Maintainer: Daniel Schopf <schopf.dan at gmail dot com>
pkgname=kim-api
pkgver=2.1.0
pkgrel=1
pkgdesc="Online framework for reliable, reproducible and portable molecular simulations"
arch=("i686" "x86_64")
url="https://openkim.org"
license=('CDDL')
depends=(bash)
makedepends=(cmake gcc-libs)
install=$pkgname.install
source=(https://s3.openkim.org/kim-api/kim-api-2.1.0.txz
	Fix-Doxygen-command-error.patch)
sha512sums=('f49535f24ad64eb53b6e7f891040694cde04cae7d183290d5ab969f8ea440932d2edad1b41d3c2672de40b152b9b1d43301879dab2e12815eac6e9dfeba54238'
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
