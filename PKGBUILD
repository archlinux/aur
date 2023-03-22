# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=ps3dec
pkgname=$_pkgname-git
pkgver=r2.7d1d27f
pkgrel=1
pkgdesc="ISO encryptor/decryptor for PS3 disc images"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/al3xtjames/PS3Dec"
license=('custom:WTFPL')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git' 'mbedtls')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libmbedcrypto.so')
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/bin build/Release/PS3Dec
}
