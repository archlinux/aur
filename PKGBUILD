# Maintainer: UnicornDarkness
# Contributor: Anthony Wang <a at exozy dot me>
# Contributor: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Benjamin Maisonnas <ben at wainei dot net>
# Author: Ondrej Čerman

_pkgname=zenpower3
pkgname=zenpower3-dkms-git
epoch=3
pkgver=r71.41e0429
pkgrel=1
pkgdesc="A Linux kernel driver for reading temperature, voltage(SVI2), current(SVI2) and power(SVI2) for AMD Zen family CPUs, now with Zen 3 support'"
arch=('i686' 'x86_64')
url="https://github.com/AliEmreSenel/zenpower3"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('zenpower3' 'zenpower3-dkms')
conflicts=('zenpower3' 'zenpower3-dkms')
install=$_pkgname.install
source=("git+https://github.com/AliEmreSenel/zenpower3.git"
        "$_pkgname.conf")
sha256sums=('SKIP'
            '7bff3a5ea2c8b8abf56ce1d79b9724b1aea89e2564d244e09691070113d60f6a')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	sed -e "s/@CFLGS@//" \
		-e "s/@VERSION@/$pkgver/" \
		-e "/CLEAN=/d" \
		-i "$srcdir/$_pkgname/dkms.conf"
}

package() {
	install -Dm644 "$srcdir/$_pkgname/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
	install -Dm644 "$srcdir/$_pkgname/Makefile" "$pkgdir/usr/src/$_pkgname-$pkgver/Makefile"
	install -Dm644 "$srcdir/$_pkgname/zenpower.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenpower.c"
	install -Dm644 "$srcdir/$_pkgname.conf" "$pkgdir/usr/lib/modprobe.d/$_pkgname.conf"
}
