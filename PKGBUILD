# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=zycore-c
pkgname=$_pkgname-git
pkgver=1.0.0.r20.g767719d
pkgrel=1
pkgdesc='Zyan core library for C'
arch=('x86_64')
url="https://github.com/zyantific/$_pkgname"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'git' 'ninja')
provides=("$_pkgname=$pkgver" 'libZycore.so')
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DZYCORE_BUILD_SHARED_LIB=ON \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
