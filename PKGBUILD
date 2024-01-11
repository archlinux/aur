# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-melondsds
pkgname=$_pkgname-git
pkgver=0.8.7.r23.gd13a8a2
pkgrel=1
pkgdesc="Nintendo DS core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/JesseTG/melonds-ds"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info>=1.16.0.3.r2')
makedepends=('cmake>=3.19' 'git' 'libgl')
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
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libOpenGL.so')
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/src/libretro/melondsds_libretro.so
}
