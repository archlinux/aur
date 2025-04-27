# Maintainer: fedefranc <ffaur-at-duck-dot-com>
# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: SingYan <singyan@tuta.io>

pkgname=mydumper
pkgver=0.19.1_3
pkgrel=1
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://github.com/mydumper/mydumper"
license=('GPL-3.0-or-later')
depends=("glibc" "glib2" "mariadb-libs" "pcre2")
makedepends=("cmake")

source=("https://github.com/mydumper/mydumper/archive/v${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz")

sha256sums=('e7feab21b8073a5a7809cf7cc56a08ae0f93313dfe3f6f1fe5c96eec12f09f9d')

build() {
	# NOTE! As of 0.16.7-5 There is a maybe-uninitialized warning that is treated as an error
	# This is a workaround to fix it, remove as soon as upstream releases the fix
	cmake -B build -S "$srcdir/$pkgname-${pkgver//_/-}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DCMAKE_C_FLAGS_RELEASE="-Wno-unused-result -O2 -Wno-maybe-uninitialized"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
