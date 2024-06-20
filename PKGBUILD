# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-powerpc
pkgver=22
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (powerpc)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-powerpc}"
license=('GPL')
makedepends=('powerpc-440fp-glibc-bleeding-edge-toolchain'
             'powerpc-440fp-musl-bleeding-edge-toolchain'
             'git'
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-powerpc}/archive/v$pkgver.tar.gz")
sha256sums=('09e7f9c52007090aceb53831103aba9d3ee72df3b41ce9c0ddb76f573a446e8c')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-powerpc}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-powerpc}-$pkgver"
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr powerpc/libiamroot.so.1
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr powerpc/libiamroot-musl-powerpc.so.1
}

check() {
	cd "${pkgname%-powerpc}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-powerpc}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-powerpc.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-powerpc-musl-powerpc.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-support-powerpc
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
