# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-armhf
pkgver=20
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (armhf)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-armhf}"
license=('GPL')
makedepends=('armv7-eabihf-glibc-bleeding-edge-toolchain'
             'armv7-eabihf-musl-bleeding-edge-toolchain'
             'git'
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-armhf}/archive/v$pkgver.tar.gz")
sha256sums=('27c3019135fce9359a7e7ff6abb0501108c4881e6c57609f4c14d0fb91f17eec')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-armhf}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-armhf}-$pkgver"
	make CFLAGS= PREFIX=/usr armhf/libiamroot-linux-armhf.so.3
	make CFLAGS= PREFIX=/usr armhf/libiamroot-musl-armhf.so.1
}

check() {
	cd "${pkgname%-armhf}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-armhf}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-armhf-linux-armhf.3
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-armhf-musl-armhf.1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
