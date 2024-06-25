# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-powerpc
pkgver=23
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
sha256sums=('f33087f278f02cb94c25c9e6d97b288f9deed61f3b959615a6c20ebabbd0390d')
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
