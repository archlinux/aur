# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-dolphin
pkgname=$_pkgname-git
pkgver=r33044.89a4df725d
pkgrel=1
pkgdesc="Nintendo GameCube/Wii core"
arch=('x86_64')
url="https://github.com/libretro/dolphin"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=(
	'enet'
	'gcc-libs'
	'glibc'
	'libretro-core-info'
	'libx11'
	'libxi'
	'libxrandr'
	'pugixml'
)
makedepends=(
	'bluez-libs'
	'bzip2'
	'cmake'
	'cubeb'
	'curl'
	'fmt'
	'git'
	'hidapi'
	'libegl'
	'libevdev'
	'libpng'
	'libsystemd'
	'libusb'
	'lzo'
	'mbedtls2'
	'python'
	'sfml'
	'xorgproto'
	'xxhash'
	'xz'
	'zlib'
	'zstd'
)
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'5c21d83d249ec4205aa75c4cef4d322c1c0c332496133b698ca08bd2a63eb1f2cce3968125924125ac44547b5db200a1228e77fe26862082632cd0c8ca37e01c'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	patch -d $_pkgname -Np1 < use-system-libs.patch
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DENABLE_LTO=OFF \
		-DENABLE_TESTS=OFF \
		-DLIBRETRO=ON \
		-DUSE_SHARED_ENET=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=(
		'libbluetooth.so'
		'libbz2.so'
		'libcubeb.so'
		'libcurl.so'
		'libEGL.so'
		'libevdev.so'
		'libfmt.so'
		'libGLX.so'
		'libhidapi-hidraw.so'
		'liblzma.so'
		'liblzo2.so'
		'libmbedcrypto.so'
		'libmbedtls.so'
		'libmbedx509.so'
		'libpng16.so'
		'libsfml-network.so'
		'libsfml-system.so'
		'libudev.so'
		'libusb-1.0.so'
		'libxxhash.so'
		'libz.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/dolphin_libretro.so
}
