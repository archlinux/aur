# Maintainer: Cédric Schieli <cschieli at gmail dot com>
pkgname=klibc
pkgver=2.0.6
pkgrel=1
pkgdesc="A minimalistic libc subset for use with initramfs"
arch=(x86_64)
url="https://mirrors.kernel.org/pub/linux/libs/klibc/"
license=('GPL')
groups=()
depends=(perl)
makedepends=(linux-api-headers)
provides=()
conflicts=()
replaces=()
backup=()
options=('staticlibs')
install=
source=(
	"https://mirrors.kernel.org/pub/linux/libs/klibc/2.0/${pkgname}-${pkgver}.tar.xz"
	"fix_missing_include_in_sys_mman_h.patch::https://git.kernel.org/pub/scm/libs/klibc/klibc.git/patch/?id=d4853d030639cf3542ae39129c18b654d8d4f020"
)
noextract=()
md5sums=('d01e2f8fa8a616c8523787ea4c634e8b'
         '8d7744591b5ba254fe6d4ef324a5383e')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/fix_missing_include_in_sys_mman_h.patch"
	mkdir -p uapi/include
	ln -sf /usr/include/{asm,asm-generic,linux} uapi/include/
}

build() {
	cd "$pkgname-$pkgver"
	make KLIBCKERNELSRC=uapi
}

check() {
	cd "$pkgname-$pkgver"
	make -k KLIBCKERNELSRC=uapi test
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/lib"
	ln -s "$pkgdir/usr/lib" "$pkgdir/lib"
	make KLIBCKERNELSRC=uapi INSTALLROOT="$pkgdir" mandir=/usr/share/man install
	rm -f "$pkgdir/lib"
}
