# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-powerpc64le
pkgver=23
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (powerpc64le)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-powerpc64le}"
license=('GPL')
makedepends=('powerpc64le-power8-glibc-bleeding-edge-toolchain'
             'powerpc64le-power8-musl-bleeding-edge-toolchain'
             'git'
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-powerpc64le}/archive/v$pkgver.tar.gz")
sha256sums=('f33087f278f02cb94c25c9e6d97b288f9deed61f3b959615a6c20ebabbd0390d')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-powerpc64le}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-powerpc64le}-$pkgver"
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr powerpc64le/libiamroot.so.2
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr powerpc64le/libiamroot-musl-powerpc64le.so.1
}

check() {
	cd "${pkgname%-powerpc64le}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-powerpc64le}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-powerpc64le.2
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-powerpc64le-musl-powerpc64le.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-support-powerpc64le
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
