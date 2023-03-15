# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-armhf
pkgver=8
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (armhf)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-armhf}"
license=('GPL')
makedepends=('armhf-musl'
             'arm-linux-gnueabihf-gcc'
             'kernel-headers-musl-armhf'
             'git'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-armhf}/archive/v$pkgver.tar.gz")
sha256sums=('f1559d3a54fa251bd355cddb2b426bd5c8223adaa3bd6e9b34e7b05b2afe0539')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-armhf}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-armhf}-$pkgver"
	make CFLAGS= armhf/libiamroot-linux-armhf.so.3
	make CFLAGS= armhf/libiamroot-musl-armhf.so.1
}

check() {
	cd "${pkgname%-armhf}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-armhf}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-armhf-linux-armhf.3
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-armhf-musl-armhf.1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
