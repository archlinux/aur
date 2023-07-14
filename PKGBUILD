# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-riscv64
pkgver=11
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (riscv64)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-riscv64}"
license=('GPL')
makedepends=('riscv64-linux-musl'
             'riscv64-linux-gnu-gcc'
             'riscv64-linux-musl-linux-api-headers'
             'git'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-riscv64}/archive/v$pkgver.tar.gz")
sha256sums=('fc8e1d618e62aed40064561e2a14f0c763e5b33d41c5f888e45042e561eddfe0')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-riscv64}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-riscv64}-$pkgver"
	make CFLAGS= PREFIX= riscv64/libiamroot-linux-riscv64-lp64d.so.1
	make CFLAGS= PREFIX= riscv64/libiamroot-musl-riscv64.so.1
}

check() {
	cd "${pkgname%-riscv64}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-riscv64}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-riscv64-linux-riscv64-lp64d.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-riscv64-musl-riscv64.1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
