# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=sirit
pkgname=$_pkgname-git
pkgver=r184.a395963
pkgrel=1
pkgdesc='A runtime SPIR-V assembler'
arch=('x86_64')
url="https://github.com/ReinUsesLisp/$_pkgname"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'spirv-headers>=1.5.4.raytracing.fixed.r32')
provides=("$_pkgname=$pkgver" 'libsirit.so')
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# unbundle spirv-headers
	sed -i '/SPIRV-Headers/d' $_pkgname/CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	install -Dm755 -t "$pkgdir"/usr/lib build/src/libsirit.so
	install -Dm644 -t "$pkgdir"/usr/include/sirit $_pkgname/include/sirit/sirit.h
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
