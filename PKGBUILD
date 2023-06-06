# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Cédric Schieli <cschieli at gmail dot com>

pkgname=klibc
pkgver=2.0.12
pkgrel=1
pkgdesc="A minimalistic libc subset for use with initramfs"
arch=(x86_64 aarch64 i686)
url="https://mirrors.kernel.org/pub/linux/libs/klibc/"
license=('GPL')
depends=(perl)
makedepends=(linux-api-headers)
options=('staticlibs')
source=("https://mirrors.kernel.org/pub/linux/libs/klibc/2.0/${pkgname}-${pkgver}.tar.xz")
sha256sums=('71f816a0d3abe3aba8b46319ae5ca147e7a7a38401b3f5e262025f4dc08c475d')

prepare() {
	cd "$pkgname-$pkgver"
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
