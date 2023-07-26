# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>

pkgname=umr
pkgver=1.0.8
pkgrel=1
pkgdesc='User Mode Register Debugger for AMDGPU Hardware'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/tomstdenis/umr'
license=('MIT')
depends=('libpciaccess' 'ncurses' 'llvm-libs')
makedepends=('cmake' 'llvm' 'libdrm')
source=("$url/-/archive/$pkgver/umr-$pkgver.tar.bz2")
sha256sums=('a4c817588e7646a7efb0a177cdddcab58c49fc0923b33b5105dd3ac0183b276a')

build() {
	local cmake_args=(
		-B build -S "$pkgname-$pkgver"
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_INSTALL_LIBDIR=lib
		-DCMAKE_BUILD_TYPE=Release
		-DUMR_NO_GUI=ON
	)

	cmake "${cmake_args[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	# Remove some files which should not be installed. See:
	# https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/32
	rm -rf "$pkgdir/usr/bin/umrgui"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "$pkgname-$pkgver/LICENSE"
}
