# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>

pkgname=umr-git
epoch=1
pkgver=r1090.cc16f19
pkgrel=2
pkgdesc='userspace debugging and diagnostic tool for AMD GPUs using the AMDGPU kernel driver'
arch=('i686' 'x86_64')
url='https://lists.freedesktop.org/archives/amd-gfx/2017-February/005122.html'
license=('MIT')
depends=('libpciaccess' 'ncurses' 'llvm-libs')
makedepends=('git' 'cmake' 'llvm' 'libdrm')
provides=('umr')
conflicts=('umr')
source=('git+https://gitlab.freedesktop.org/tomstdenis/umr.git')
sha256sums=('SKIP')
#options=(debug "!strip")

pkgver() {
	cd umr
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	local cmake_args=(
		-B build -S umr
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
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 umr/LICENSE
}
