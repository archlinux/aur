# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot
pkgver=8
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process'
arch=('x86_64')
url="https://github.com/gportay/$pkgname"
license=('GPL')
makedepends=('lib32-glibc'
             'i386-musl'
             'kernel-headers-musl-i386'
             'musl'
             'kernel-headers-musl'
             'git'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f1559d3a54fa251bd355cddb2b426bd5c8223adaa3bd6e9b34e7b05b2afe0539')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "$pkgname-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "$pkgname-$pkgver"
	make i686/libiamroot-linux.so.2
	make i686/libiamroot-musl-i386.so.1
	make x86_64/libiamroot-linux-x86-64.so.2
	make x86_64/libiamroot-musl-x86_64.so.1
	make doc
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-i686-linux.2
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-i686-musl-i386.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-x86_64-linux-x86-64.2
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-x86_64-musl-x86_64.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-doc
	make PREFIX=/usr DESTDIR="$pkgdir" install-bash-completion
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
