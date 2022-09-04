# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=cpp-jwt
pkgname=$_pkgname-git
pkgver=1.4.r16.g4b66cf7
pkgrel=1
pkgdesc="JSON Web Token library for C++"
arch=('any')
url="https://github.com/arun11299/cpp-jwt"
license=('MIT')
depends=('nlohmann-json' 'openssl')
makedepends=('cmake' 'git')
checkdepends=('gtest')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCPP_JWT_BUILD_EXAMPLES=OFF \
		-DCPP_JWT_BUILD_TESTS="$CHECKFUNC" \
		-DCPP_JWT_USE_VENDORED_NLOHMANN_JSON=OFF \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
