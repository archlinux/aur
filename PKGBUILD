# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-aarch64_be
pkgver=23
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (aarch64_be)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-aarch64_be}"
license=('GPL')
makedepends=('aarch64be-glibc-bleeding-edge-toolchain'
             'aarch64be-musl-bleeding-edge-toolchain'
             'git'
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-aarch64_be}/archive/v$pkgver.tar.gz")
sha256sums=('f33087f278f02cb94c25c9e6d97b288f9deed61f3b959615a6c20ebabbd0390d')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-aarch64_be}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-aarch64_be}-$pkgver"
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr aarch64_be/libiamroot-linux-aarch64_be.so.1
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr aarch64_be/libiamroot-musl-aarch64_be.so.1
}

check() {
	cd "${pkgname%-aarch64_be}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-aarch64_be}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-aarch64_be-linux-aarch64_be.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-aarch64_be-musl-aarch64_be.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-support-aarch64_be
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
