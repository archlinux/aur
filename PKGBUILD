# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=aom
pkgname=(
	lib32-aom
)
pkgver=3.12.0
pkgrel=1
pkgdesc="Alliance for Open Media video codec (32-bit)"
url="https://aomedia.org/"
arch=(x86_64)
license=(BSD-3-Clause)
depends=(
	lib32-glibc
	aom
	lib32-gcc-libs
)
makedepends=(
	cmake
	ninja
	yasm
)
source=(
	https://storage.googleapis.com/aom-releases/libaom-$pkgver.tar.gz{,.asc}
)
b2sums=('fd38ccfcc7cb43099fad9842cc3bfb13d7e421bd9def4cc9660217d50a09f0b9e064b69b780791329971cce67518475d9760c3ccc1fa9052805b46c32ee9e225'
        'SKIP')
validpgpkeys=(
	B002F08B74A148DAA01F7123A48E86DB0B830498 # AOMedia release signing key <av1-discuss@aomedia.org>
)

prepare() {
	cd libaom-$pkgver
}

build() {
	local cmake_options=(
		# Upstream would like Release, adding -O3 and removing assertions
		# https://gitlab.archlinux.org/archlinux/packaging/packages/aom/-/issues/1
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_INSTALL_LIBDIR=lib32
		-D CMAKE_BUILD_TYPE=None
		-D BUILD_SHARED_LIBS=1
		-D ENABLE_TESTS=0
		-D ENABLE_DOCS=0
	)

	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	cmake -S libaom-$pkgver -B build -G Ninja "${cmake_options[@]}"

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libaom-$pkgver/{LICENSE,PATENTS}

	cd "$pkgdir/usr"

	rm -r bin include
}
