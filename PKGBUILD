# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-mipsle
pkgver=17
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
sha256sums=('1d78d29eff289407fb3c9c11c3bcb2df7897b047b8b46563b024530e4e49b0be')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-mipsle}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-mipsle}-$pkgver"
	make CFLAGS= PREFIX=/usr mipsle/libiamroot.so.1
	make CFLAGS= PREFIX=/usr mipsle/libiamroot-musl-mipsel.so.1
}

check() {
	cd "${pkgname%-mipsle}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-mipsle}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-mipsle.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-mipsle-musl-mipsel.1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
