# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=discord-rpc
pkgname=$_pkgname-git
pkgver=3.4.0.r10.g963aa9f
pkgrel=2
pkgdesc="Discord Rich Presence library"
arch=('x86_64')
url="https://github.com/discord/discord-rpc"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'rapidjson>=1.1')
provides=("$_pkgname=$pkgver" 'libdiscord-rpc.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_EXAMPLES=OFF \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
