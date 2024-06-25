# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-mipsle
pkgver=23
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (mipsle)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-mipsle}"
license=('GPL')
makedepends=('mips32el-glibc-bleeding-edge-toolchain'
             'mips32el-musl-bleeding-edge-toolchain'
             'git'
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-mipsle}/archive/v$pkgver.tar.gz")
sha256sums=('f33087f278f02cb94c25c9e6d97b288f9deed61f3b959615a6c20ebabbd0390d')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-mipsle}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-mipsle}-$pkgver"
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr mipsle/libiamroot.so.1
	make CFLAGS=-DJIM_REGEXP PREFIX=/usr mipsle/libiamroot-musl-mipsel.so.1
}

check() {
	cd "${pkgname%-mipsle}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-mipsle}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-mipsle.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-mipsle-musl-mipsel.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-support-mipsle
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
