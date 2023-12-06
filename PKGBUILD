# Maintainer: Paris Oplopoios <parisoplop@gmail.com>

_pkgname=Panda3DS
_latest_release=0.7
_executable_name=Alber
_install_name=panda3ds

pkgname=panda3ds-git
pkgver=0.7.r1603.95c1923c
pkgrel=1
pkgdesc="HLE 3DS emulator"
arch=('x86_64')
url="https://panda3ds.com"
license=('GPL3')

# Panda3DS Dependencies
depends=(
	gcc-libs
	libxext
)

# Build Dependencies
makedepends=(
	cmake
	ninja
	git
	clang
)

provides=(panda3ds)
conflicts=(panda3ds)
source=("git+https://github.com/wheremyfoodat/Panda3DS")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s.r%s.%s" \
	"$_latest_release" \
	"$(git rev-list --count HEAD)" \
	"$(git rev-parse --short HEAD)"
}

build() {
	export CXX=clang++
	export CC=clang
	cd $_pkgname
	git submodule update --init --recursive
	cmake -S . -B build -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_USER_BUILD=ON -DENABLE_VULKAN=OFF -GNinja
	cmake --build build -j$(nproc)
}

package() {
	cd $_pkgname
	install -vDm 755 "build/$_executable_name" "$pkgdir/usr/bin/$_install_name"
}
