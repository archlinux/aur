# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=sirit
pkgname=$_pkgname-git
pkgver=r184.a395963
pkgrel=2
pkgdesc='A runtime SPIR-V assembler'
arch=('x86_64')
url="https://github.com/ReinUsesLisp/$_pkgname"
license=('BSD')
depends=('gcc-libs' 'spirv-headers>=1.5.4.raytracing.fixed.r32')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" 'libsirit.so')
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	# add cmake install rules
	git pull --squash origin pull/28/head
	# unbundle spirv-headers
	sed -i /SPIRV-Headers/d CMakeLists.txt
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
