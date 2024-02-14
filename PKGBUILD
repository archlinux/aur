# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot-arm
pkgver=18
pkgrel=1
pkgdesc='Emulating the syscall chroot(2) in an unpriviliged process (arm)'
arch=('x86_64')
url="https://github.com/gportay/${pkgname%-arm}"
license=('GPL')
makedepends=('armv5-eabi-glibc-bleeding-edge-toolchain'
             'armv5-eabi-musl-bleeding-edge-toolchain'
             'git'
             'patchelf'
             'asciidoctor')
checkdepends=('shellcheck')
options=('!strip')
source=("https://github.com/gportay/${pkgname%-arm}/archive/v$pkgver.tar.gz")
sha256sums=('0a25f1f4558dc8fe4e0992499f913e28151e9805c9e5b4b3de882bdd68bfa20a')
validpgpkeys=('8F3491E60E62695ED780AC672FA122CA0501CA71')

prepare() {
	cd "${pkgname%-arm}-$pkgver"
	ln -sf support/linux.mk makefile
	touch local.mk
}

build() {
	cd "${pkgname%-arm}-$pkgver"
	make CFLAGS= PREFIX=/usr arm/libiamroot-linux.so.3
	make CFLAGS= PREFIX=/usr arm/libiamroot-musl-arm.so.1
}

check() {
	cd "${pkgname%-arm}-$pkgver"
	make -k check
}

package() {
	cd "${pkgname%-arm}-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-arm-linux.3
	make PREFIX=/usr DESTDIR="$pkgdir" install-exec-arm-musl-arm.1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
