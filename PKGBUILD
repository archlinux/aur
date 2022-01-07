# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daurnimator <quae@daurnimator.com>

pkgname=libmcl
pkgver=1.52
pkgrel=2
pkgdesc='Portable and fast pairing-based cryptography library'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'arm')
url='https://github.com/herumi/mcl'
license=('BSD')
depends=('gmp')
makedepends=('cmake')
provides=('libmclbn384_256.so' 'libmclbn384.so' 'libmclbn256.so' 'libmcl.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a9ef34e0fc035c43698caa877ce7fb4d101865563f81b818e923eb5b5b2f7105')

build() {
	cmake \
		-B build \
		-S "mcl-$pkgver" \
		-Wno-dev \
		-DBUILD_TESTING=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make -C build
}

check() {
	cd build
	ctest --output-on-failure
}

package() {
	make -C build DESTDIR="$pkgdir" install
	cd "mcl-$pkgver"
	install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
