# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-dolphin
pkgname=$_pkgname-git
pkgver=r33042.2f4b0f7902
pkgrel=4
pkgdesc="Nintendo GameCube/Wii core"
arch=('x86_64')
url="https://github.com/libretro/dolphin"
license=('GPL2')
groups=('libretro')
depends=(
	'enet'
	'gcc-libs'
	'glibc'
	'libpng'
	'libretro-core-info'
	'libx11'
	'libxi'
	'libxrandr'
	'pugixml'
	'zlib'
)
makedepends=(
	'bluez-libs'
	'bzip2'
	'cmake'
	'cubeb'
	'curl'
	'fmt9'
	'git'
	'hidapi'
	'libevdev'
	'libglvnd'
	'libusb'
	'lzo'
	'mbedtls2'
	'python'
	'sfml'
	'systemd-libs'
	'xorgproto'
	'xxhash'
	'xz'
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
	'b149713ac0faaf7aeeaca3f0a4f82ee40085c9b7caa34b55a9182d8d4146670b0c774a89e96d4c4cedebf49168394940f636d3bc61f1878238fd5850992a8990'
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
		'libsfml-network.so'
		'libsfml-system.so'
		'libudev.so'
		'libusb-1.0.so'
		'libxxhash.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/dolphin_libretro.so
}
