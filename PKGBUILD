# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=zydis
pkgname=$_pkgname-git
pkgver=3.1.0.r75.g6a17c48
pkgrel=1
pkgdesc='Fast and lightweight x86/x86-64 disassembler library'
arch=('x86_64')
url='https://zydis.re/'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" 'libZydis.so')
conflicts=("$_pkgname")
source=(
	"git+https://github.com/zyantific/$_pkgname.git"
	'git+https://github.com/zyantific/zycore-c.git'
)
b2sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git submodule init dependencies/zycore
	git config submodule.dependencies/zycore.url ../zycore-c
	git submodule update
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DZYDIS_BUILD_SHARED_LIB=ON \
		-DZYDIS_FEATURE_AVX512=OFF \
		-DZYDIS_FEATURE_KNC=OFF \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	DESTDIR="$pkgdir" cmake --install build/zycore
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
	# remove leftover files
	rm -r "$pkgdir"/usr/{cmake,lib/libZycore.a}
}
