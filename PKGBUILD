# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>

pkgname=umr
pkgver=1.0.10
pkgrel=1
pkgdesc='User Mode Register Debugger for AMDGPU Hardware'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/tomstdenis/umr'
license=('MIT')
depends=('libpciaccess' 'ncurses' 'llvm-libs')
makedepends=('cmake' 'llvm' 'libdrm')
source=("$url/-/archive/$pkgver/umr-$pkgver.tar.bz2")
sha256sums=('9bb1b9a95d1d2a9f23f8d5126d5c073f82e6a580268f7d7bcafb0d95ce655f79')

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
	# The MR has landed and was effectively reverted with
	# https://gitlab.freedesktop.org/tomstdenis/umr/-/commit/cdba623668920a0c765c50d84ac66f7b73658ccb
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "$pkgname-$pkgver/LICENSE"
}
