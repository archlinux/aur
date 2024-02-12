# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>

pkgname=umr-git
epoch=1
pkgver=r1177.d3fd0f4
pkgrel=1
pkgdesc='User Mode Register Debugger for AMDGPU Hardware'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/tomstdenis/umr.git'
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
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 umr/LICENSE
}
