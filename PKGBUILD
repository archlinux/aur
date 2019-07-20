# Maintainer: Cédric Schieli <cschieli at gmail dot com>
pkgname=klibc-git
pkgver=2.0.6.r11.603f1bb0
pkgrel=1
pkgdesc="A minimalistic libc subset for use with initramfs"
arch=(x86_64)
url="https://mirrors.kernel.org/pub/linux/libs/klibc/"
license=('GPL')
groups=()
depends=(perl)
makedepends=(git linux-api-headers)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('staticlibs')
install=
source=("${pkgname%-git}::git+https://git.kernel.org/pub/scm/libs/klibc/klibc.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^klibc-//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p uapi/include
	ln -sf /usr/include/{asm,asm-generic,linux} uapi/include/
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make KLIBCKERNELSRC=uapi
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k KLIBCKERNELSRC=uapi test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/lib"
	ln -s "$pkgdir/usr/lib" "$pkgdir/lib"
	make KLIBCKERNELSRC=uapi INSTALLROOT="$pkgdir" mandir=/usr/share/man install
	rm -f "$pkgdir/lib"
}
