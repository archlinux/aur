# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: UnicornDarkness
# Contributor: Anthony Wang <a at exozy dot me>
# Contributor: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Benjamin Maisonnas <ben at wainei dot net>
# Contributor: Ondrej Čerman

_pkgname=zenpower5
pkgname=zenpower5-dkms-git
epoch=5
pkgver=r73.873bfa5
pkgrel=1
pkgdesc="Linux kernel driver for AMD Zen CPU monitoring (Zen 1-5): temperature, voltage, current, and power via SVI2/RAPL. Multi-file architecture with Zen 5 (Strix Halo) support"
arch=('i686' 'x86_64')
url="https://github.com/mattkeenan/zenpower5"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('zenpower5' 'zenpower5-dkms')
conflicts=('zenpower5' 'zenpower5-dkms')
install=$_pkgname.install
source=("git+https://github.com/mattkeenan/zenpower5.git"
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
	install -Dm644 "$srcdir/$_pkgname/zenpower_core.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenpower_core.c"
	install -Dm644 "$srcdir/$_pkgname/zenpower_rapl.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenpower_rapl.c"
	install -Dm644 "$srcdir/$_pkgname/zenpower_svi2.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenpower_svi2.c"
	install -Dm644 "$srcdir/$_pkgname/zenpower_temp.c" "$pkgdir/usr/src/$_pkgname-$pkgver/zenpower_temp.c"
	install -Dm644 "$srcdir/$_pkgname/zenpower.h" "$pkgdir/usr/src/$_pkgname-$pkgver/zenpower.h"
	install -Dm644 "$srcdir/$_pkgname.conf" "$pkgdir/usr/lib/modprobe.d/$_pkgname.conf"
}
