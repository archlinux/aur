# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-aarch64
pkgver=14
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (aarch64)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-aarch64}"
license=('GPL')
makedepends=('aarch64-glibc-bleeding-edge-toolchain'
             'aarch64-musl-bleeding-edge-toolchain'
             'git'
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-aarch64}/archive/v$pkgver.tar.gz")
sha256sums=('4ea344b21249225c1852271f4983d72351df1516eacaae2042f663cbc55d48e7')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-aarch64}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-aarch64}-$pkgver"
	make CFLAGS= PREFIX=/usr aarch64/libiamroot-linux-aarch64.so.1
	make CFLAGS= PREFIX=/usr aarch64/libiamroot-musl-aarch64.so.1
}

check() {
	cd "${pkgname%-aarch64}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-aarch64}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-aarch64-linux-aarch64.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-aarch64-musl-aarch64.1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
