# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-virtualxt
pkgname=$_pkgname-git
pkgver=0.7.r358.g467fdf2
pkgrel=1
pkgdesc="IBM PC/XT core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://virtualxt.org/"
license=('custom:zlib-acknowledgement')
groups=('libretro')
depends=('glibc' 'libretro-core-info>=1.15.0.r1')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('virtualxt::git+https://github.com/andreas-jonsson/virtualxt.git')
b2sums=('SKIP')

pkgver() {
	cd virtualxt
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd virtualxt
	sed -i 's/-O[0123s]//;s/-Ofast//' tools/package/libretro/Makefile
	sed -i '$a CFLAGS += -I$(CORE_DIR)/front/common' tools/package/libretro/Makefile
}

build() {
	cd virtualxt
	make -C tools/package/libretro
}

package() {
	cd virtualxt
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro tools/package/libretro/virtualxt_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
