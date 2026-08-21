# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=ps3dec
pkgname=$_pkgname-git
pkgver=r2.7d1d27f
pkgrel=3
pkgdesc="ISO encryptor/decryptor for PS3 disc images"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/al3xtjames/PS3Dec"
license=('WTFPL')
depends=('glibc')
makedepends=('cmake' 'git' 'libgcc' 'libgomp' 'mbedtls3')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	local options=(
		-B build
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INCLUDE_PATH="/usr/include/mbedtls3"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_LIBRARY_PATH="/usr/lib/mbedtls3"
		-W no-dev
	)
	cmake "${options[@]}" $_pkgname
	cmake --build build
}

package() {
	depends+=('libgcc_s.so' 'libgomp.so' 'libmbedcrypto.so')

	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/bin build/Release/PS3Dec
}
