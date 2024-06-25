# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-powerpc64
pkgver=23
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (powerpc64)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-powerpc64}"
license=('GPL')
makedepends=('powerpc64-power8-musl-bleeding-edge-toolchain'
             'git'
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-powerpc64}/archive/v$pkgver.tar.gz")
sha256sums=('f33087f278f02cb94c25c9e6d97b288f9deed61f3b959615a6c20ebabbd0390d')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-powerpc64}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-powerpc64}-$pkgver"
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr powerpc64/libiamroot-musl-powerpc64.so.1
}

check() {
	cd "${pkgname%-powerpc64}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-powerpc64}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-powerpc64-musl-powerpc64.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-support-powerpc64
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
