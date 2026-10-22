# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=zarchive
pkgname=$_pkgname-git
pkgver=0.1.2.r4.g965b66c
pkgrel=1
pkgdesc='Library for creating and reading zstd-compressed file archives (.zar)'
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/Exzap/ZArchive"
license=('MIT')
depends=('glibc')
makedepends=('cmake>=3.15' 'git' 'libgcc' 'libstdc++' 'zstd')
provides=("$_pkgname=$pkgver" 'libzarchive.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

build() {
	local options=(
		-B shared
		-D BUILD_SHARED_LIBS=ON
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-W no-dev
	)
	cmake "${options[@]}" $_pkgname
	cmake --build shared
}

package() {
	depends+=('libgcc_s.so' 'libstdc++.so' 'libzstd.so')

	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install shared
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
