# Maintainer: Ivan <vanno6521@gmail.com>
pkgname=niiet-openocd-git
pkgver=0.12.0_ged6429411
pkgrel=1
pkgdesc="Provides on-chip programming and debugging support, also for NIIET MCUs"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitflic.ru/project/niiet/openocd"
license=('GPL')
depends=('hidapi' 'libftdi-compat' 'libusb' 'capstone')
makedepends=('git' 'tcl')
optdepends=('libjaylink: SEGGER J-Link support')
provides=('openocd')
conflicts=('openocd')
options=(!strip)

source=(
	"${pkgname}::git+https://gitflic.ru/project/niiet/openocd.git"
	"git+https://github.com/msteveb/jimtcl.git"
)

sha256sums=('SKIP'
			'SKIP')

prepare() {
	cd "$srcdir/${pkgname}"

	sed -i 's|GROUP="plugdev", ||g' contrib/60-openocd.rules
	git submodule init
	git config submodule.jimtcl.url "$srcdir/jimtcl"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname}"

	./bootstrap
	./configure --prefix=/usr CFLAGS='-Wno-calloc-transposed-args'

	make
}

package() {
	cd "$srcdir/${pkgname}"

	make "DESTDIR=${pkgdir}" install
	install -Dm 644 contrib/60-openocd.rules "$pkgdir"/usr/lib/udev/rules.d/60-openocd.rules
}
