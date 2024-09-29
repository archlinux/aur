# Maintainer: fedefranc <ffaur-at-duck-dot-com>
# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: SingYan <singyan@tuta.io>

pkgname=mydumper
pkgver=0.16.7_5
pkgrel=1
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://github.com/mydumper/mydumper"
license=('GPL')
depends=("glib2" "mariadb-libs" "pcre" "pcre2" "openssl")
makedepends=("cmake")

source=("https://github.com/mydumper/mydumper/archive/v${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz")

sha256sums=('f554552fe96c40a47b82018eb067168bcb267a96fd288ddf8523c9e472340f2e')

build() {
	# NOTE! As of 0.16.7-5 There is a maybe-uninitialized warning that is treated as an error
	# This is a workaround to fix it, remove as soon as upstream releases the fix
	cmake -B build -S "$srcdir/$pkgname-${pkgver//_/-}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-Wno-unused-result -O2 -Wno-maybe-uninitialized"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
