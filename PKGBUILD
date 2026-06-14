# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=pam-lid-block
pkgver=0.1.0
pkgrel=1
pkgdesc='A PAM helper to skip fingerprint authentication when the laptop lid is closed'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/shini4i/pam-lid-block'
license=('GPL-3.0-only')
depends=('systemd-libs')
makedepends=('systemd')
install=pam-lid-block.install

source=("$pkgname-$pkgver.tar.gz::https://github.com/shini4i/pam-lid-block/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b2ef04430425c1864f48f08f215488ee0aa8876f017aeff56d21d66c4233b6b945bdde03ce363a21a1d2c7bec62870265caf7fbd6495657bb8ca4956136e567e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	gcc $CFLAGS -DVERSION=\"$pkgver\" -fPIE \
		$(pkg-config --cflags libsystemd) \
		-o check-lid src/check-lid.c \
		$LDFLAGS -pie \
		$(pkg-config --libs libsystemd)
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 check-lid "$pkgdir/usr/bin/check-lid"
	install -Dm644 docs/check-lid.1 "$pkgdir/usr/share/man/man1/check-lid.1"
}
