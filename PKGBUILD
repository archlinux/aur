# Maintainer: Cynthia Rey <cynthia@cynthia.dev>
pkgname=vmaware-git
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
makedepends=(git cmake)
conflicts=('vmaware')
provides=('vmaware')
license=('MIT')

options=(!debug)

source=(
	"git+$url"
	"cmake-target-none.patch"
	"cmake-disable-gxx-warning.patch"
)

b2sums=('SKIP'
        '6c34166362dc9fe11bdbde6252e0e1e1c4baef33a29f93735115af75691cc6c0ee1574101d1be05391b769ae0bfce5819097cf94fb8a39660cb68c4f14c9bbd0'
        '63bd46d0294c4e168b1188f787203a14881a6580d3dba97d68302d0680be5a9f118f352c49a950320ec7e606f438ccaac11b196682bafe9031639835d188c6c8')

prepare() {
	cd "$_pkgname"
	patch -p1 -i "$srcdir/cmake-target-none.patch"
	patch -p1 -i "$srcdir/cmake-disable-gxx-warning.patch"
}

build() {
	local cmake_options=(
		-B build
		-S $_pkgname
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)

	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir/" cmake --install build

	install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
