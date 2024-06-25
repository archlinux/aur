# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-s390x
pkgver=23
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (s390x)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-s390x}"
license=('GPL')
makedepends=('s390x-z13-glibc-bleeding-edge-toolchain'
             'git'
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-s390x}/archive/v$pkgver.tar.gz")
sha256sums=('f33087f278f02cb94c25c9e6d97b288f9deed61f3b959615a6c20ebabbd0390d')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-s390x}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-s390x}-$pkgver"
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr s390x/libiamroot.so.1
}

check() {
	cd "${pkgname%-s390x}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-s390x}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-s390x.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-support-s390x
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
