# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot
pkgver=4
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process'
arch=('x86_64')
url="https://github.com/gportay/$pkgname"
license=('GPL')
makedepends=('aarch64-linux-gnu-gcc' 'aarch64-linux-musl' 'musl' 'kernel-headers-musl' 'kernel-headers-musl-aarch64' 'asciidoctor')
checkdepends=('shellcheck')
source=("https://github.com/gportay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5259508a3d34caa8bffc6cf125027c37bca86fb78fd8011cacd646fcb13ff681')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "$pkgname-$pkgver"
	touch local.mk
}

build() {
	cd "$pkgname-$pkgver"
	make -f support/makefile x86_64/libiamroot-linux-x86-64.so.2
	make -f support/makefile x86_64/libiamroot-musl-x86_64.so.1
	make CFLAGS= -f support/makefile aarch64/libiamroot-linux-aarch64.so.1
	make CFLAGS= -f support/makefile aarch64/libiamroot-musl-aarch64.so.1
	make -f support/makefile doc
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" -f support/makefile install-exec-x86_64-linux-x86-64.2
	make PREFIX=/usr DESTDIR="$pkgdir" -f support/makefile install-exec-x86_64-musl-x86_64.1
	make PREFIX=/usr DESTDIR="$pkgdir" -f support/makefile install-exec-aarch64-linux-aarch64.1
	make PREFIX=/usr DESTDIR="$pkgdir" -f support/makefile install-exec-aarch64-musl-aarch64.1
	make PREFIX=/usr DESTDIR="$pkgdir" -f support/makefile install-doc
	make PREFIX=/usr DESTDIR="$pkgdir" -f support/makefile install-bash-completion
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
