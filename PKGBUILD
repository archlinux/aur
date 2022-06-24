# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot
pkgver=5
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
             'armhf-musl'
             'kernel-headers-musl-armhf'
             'aarch64-linux-musl'
             'aarch64-linux-gnu-gcc'
             'kernel-headers-musl-aarch64'
             'git'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2a8cd0f8bf8386622d943835f81a91c10766ba416ce8d5665ccd6b6150de8a8c')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "$pkgname-$pkgver"
	ln -sf support/makefile
	touch local.mk
}

build() {
	cd "$pkgname-$pkgver"
	make i686/libiamroot-linux.so.2
	make i686/libiamroot-musl-i386.so.1
	make x86_64/libiamroot-linux-x86-64.so.2
	make x86_64/libiamroot-musl-x86_64.so.1
	make CFLAGS= armhf/libiamroot-linux-armhf.so.3
	make CFLAGS= armhf/libiamroot-musl-armhf.so.1
	make CFLAGS= aarch64/libiamroot-linux-aarch64.so.1
	make CFLAGS= aarch64/libiamroot-musl-aarch64.so.1
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
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-aarch64-linux-aarch64.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-aarch64-musl-aarch64.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-armhf-linux-armhf.3
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-armhf-musl-armhf.1
	make PREFIX=/usr DESTDIR="$pkgdir" install-doc
	make PREFIX=/usr DESTDIR="$pkgdir" install-bash-completion
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
