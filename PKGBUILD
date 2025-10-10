# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>

pkgname=umr
pkgver=1.0.11
pkgrel=1
pkgdesc='User Mode Register Debugger for AMDGPU Hardware'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/tomstdenis/umr'
license=('MIT')
depends=('libpciaccess' 'ncurses' 'llvm-libs')
makedepends=('cmake' 'llvm' 'libdrm')
source=("$url/-/archive/$pkgver/umr-$pkgver.tar.bz2")
sha256sums=('4546b93a4ae3a44f50db839690291a3485aecec3929743c90a0bac3c2b106a51')

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
	# The fixes have landed, yet more 'breakage' happened at some point.
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "$pkgname-$pkgver/LICENSE"
}
