# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-riscv64
pkgver=13
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (riscv64)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-riscv64}"
license=('GPL')
makedepends=('riscv64-lp64d-glibc-bleeding-edge-toolchain'
             'riscv64-lp64d-musl-bleeding-edge-toolchain'
             'git'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-riscv64}/archive/v$pkgver.tar.gz")
sha256sums=('fc12143995b08c28a09e28a45062b1f41caf21b8bc5dbc4b552c338f6f8d74a5')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-riscv64}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-riscv64}-$pkgver"
	make CFLAGS= PREFIX=/usr riscv64/libiamroot-linux-riscv64-lp64d.so.1
	make CFLAGS= PREFIX=/usr riscv64/libiamroot-musl-riscv64.so.1
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
