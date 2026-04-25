# Maintainer: Cynthia Rey <cynthia@cynthia.dev>
pkgname=vmaware
_pkgname=VMAware
pkgver=2.7.0
pkgrel=1
pkgdesc='Advanced VM detection library and tool'
url='https://github.com/kernelwernel/VMAware'
arch=('x86_64')  # Upstream's supposedly compatible with other architectures but this is untested so for now it's x86_64 only
depends=(
  glibc
  libgcc
  libstdc++
)
makedepends=('cmake')
license=('MIT')

options=(!debug)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/kernelwernel/VMAware/archive/refs/tags/v$pkgver.tar.gz"
	"cmake-target-none.patch"
	"cmake-disable-gxx-warning.patch"
)

b2sums=('ebf55b6d00d74dc295ac895dfa4a2c946e1a8e93d6d2bb2d20245bc1fcc25b3168778b26d30a90e4ec536221585a9d858da0991af4d92c3d1aaf48c837ac07e4'
        '6c34166362dc9fe11bdbde6252e0e1e1c4baef33a29f93735115af75691cc6c0ee1574101d1be05391b769ae0bfce5819097cf94fb8a39660cb68c4f14c9bbd0'
        '63bd46d0294c4e168b1188f787203a14881a6580d3dba97d68302d0680be5a9f118f352c49a950320ec7e606f438ccaac11b196682bafe9031639835d188c6c8')

prepare() {
	cd "$_pkgname-$pkgver"
	patch -p1 -i "$srcdir/cmake-target-none.patch"
	patch -p1 -i "$srcdir/cmake-disable-gxx-warning.patch"
}

build() {
	local cmake_options=(
		-B build
		-S $_pkgname-$pkgver
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)

	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir/" cmake --install build

	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "$_pkgname-$pkgver/LICENSE"
}
