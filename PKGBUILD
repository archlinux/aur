# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot
pkgver=3
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process'
arch=('x86_64')
url="https://github.com/gportay/$pkgname"
license=('GPL')
makedepends=('aarch64-linux-gnu-gcc' 'aarch64-linux-musl' 'musl' 'kernel-headers-musl' 'kernel-headers-musl-aarch64' 'asciidoctor')
checkdepends=('shellcheck')
source=("https://github.com/gportay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1fca9ed4e7f30b231635da07554012ec1e3278696841a38079a233f7865436cd')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "$pkgname-$pkgver"
	ln -sf support/makefile
	touch local.mk
}

build() {
	cd "$pkgname-$pkgver"
	make CFLAGS= libiamroot-linux-aarch64.so libiamroot-musl-aarch64.so libiamroot-musl-x86_64.so libiamroot-linux-x86-64.so libiamroot.so doc
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-musl-x86_64
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-linux-aarch64
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-musl-aarch64
	make PREFIX=/usr DESTDIR="$pkgdir" install-doc
	make PREFIX=/usr DESTDIR="$pkgdir" install-bash-completion
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
