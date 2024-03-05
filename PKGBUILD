# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot
pkgver=19
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
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6c55bfa952b79a0d188d7f0add2de08cd34bbe3130202da9a4c3b8d20c37b490')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

# Fixes:
#
# 	$ ish
#	/bin/bash: symbol lookup error: /usr/lib/iamroot/libiamroot.so: undefined symbol: _Unwind_Resume
CFLAGS="${CFLAGS//-fexceptions/}"
export CFLAGS

prepare() {
	cd "$pkgname-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr i686/libiamroot-linux.so.2
	make PREFIX=/usr i686/libiamroot-musl-i386.so.1
	make PREFIX=/usr x86_64/libiamroot-linux-x86-64.so.2
	make PREFIX=/usr x86_64/libiamroot-musl-x86_64.so.1
	make PREFIX=/usr doc
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
	make PREFIX=/usr DESTDIR="$pkgdir" libiamroot.so
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec
	make PREFIX=/usr DESTDIR="$pkgdir" install-doc
	make PREFIX=/usr DESTDIR="$pkgdir" install-bash-completion
	make PREFIX=/usr DESTDIR="$pkgdir" install-support
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
