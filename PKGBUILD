# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=signal-estimator
pkgver=0.0.4
pkgrel=1
pkgdesc="Measures characteristics of a looped back signal"
arch=('x86_64')
url="https://github.com/gavv/signal-estimator"
license=('MIT')
depends=('libasound.so' 'qwt')
makedepends=('cmake' 'cxxopts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "qt5-fix.patch::$url/compare/v$pkgver...0bd6830.diff")
sha256sums=('de0acbab8947bdecbc7efaa9b9f474919bcec9bf13f7ab059cb56e5b366b04a9'
            '66d9b8eed13d7071497f348d868af99d054df8ad6e323492c702b53a4324cb28')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" < qt5-fix.patch
}

build() {
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-B build \
		-S "$pkgname-$pkgver" \
		-Wno-dev \
		-DCMAKE_BUILD_TYPE=None
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
