# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-aarch64_be
pkgver=20
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
sha256sums=('27c3019135fce9359a7e7ff6abb0501108c4881e6c57609f4c14d0fb91f17eec')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-aarch64_be}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-aarch64_be}-$pkgver"
	make CFLAGS= PREFIX=/usr aarch64_be/libiamroot-linux-aarch64_be.so.1
	make CFLAGS= PREFIX=/usr aarch64_be/libiamroot-musl-aarch64_be.so.1
}

check() {
	cd "${pkgname%-aarch64_be}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-aarch64_be}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-aarch64_be-linux-aarch64_be.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-aarch64_be-musl-aarch64_be.1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
