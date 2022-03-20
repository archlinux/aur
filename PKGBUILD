# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=mhuxd-git
pkgver=v0.50rc3.r99.gf11ac15
pkgrel=7
pkgdesc="Linux daemon implementing the microHam keyer protocol."
arch=('any')
url="https://github.com/dj5qv/mhuxd"
license=('GPL2')
# also needs kernel modules cuse and ftdi_sio
depends=('fuse2' 'libev')
makedepends=('git')
provides=('mhuxd')
source=(
	"$pkgname"::'git://github.com/dj5qv/mhuxd.git'
	'mhuxd.conf'
	'mhuxd.logrotate'
	'mhuxd.service'
	'mhuxd.sysusers'
	'mhuxd.tmpfiles'
	'kernel-modules.conf'
)
sha256sums=(
	'SKIP'
	'cd6892bb01a5f064aab568f302b33947c558e5a6d5c74dbe2a8115e9c1e082f6'
	'91ed9018153f6a7f400ea4d96a4d455a8c0fcb56b9c46e6efd974f297fd3c3bd'
	'13ee4e873540392e0111261d9fe25fbd874f52a82a7d79f610534898f141e225'
	'0f9ec94d7201acd54f518fcfe69490185d4da0c1d579d740594681b4947f08c5'
	'844574b30e2f491ed65f5a6805cc956bab29cc65d50fff8c2bc6dcb3f21face8'
	'1323ab408c1d28947cc33cc097a42275e74a5877b4f5db6c4520d67230d942a9'
)
backup=(
	"etc/conf.d/mhuxd"
)

pkgver() {
	cd "$srcdir/$pkgname"
	# use git tag or fall back to number of revisions
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	autoreconf -i
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--runstatedir=/run \
		--localstatedir=/var \
		--with-hdfdir="/usr/share/mhuxd/webui/hdf"
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd src
	make DESTDIR="$pkgdir/" install
	find "$pkgdir/var/" -maxdepth 2 -type d -empty -delete

	cd "$srcdir/$pkgname"

	install -Dm 644 "debian/mhuxd.udev" "$pkgdir/usr/lib/udev/rules.d/20-mhuxd.rules"
	install -Dm 644 "man/mhuxd.8" -t "$pkgdir/usr/share/man/man8/"
	install -dm 755 "$pkgdir/usr/share/mhuxd"
	cp -dr --no-preserve='ownership' "webui" "$pkgdir/usr/share/mhuxd/"

	cd "$srcdir"
	install -Dm 644 "mhuxd.conf" "$pkgdir/etc/conf.d/mhuxd"
	install -Dm 644 "mhuxd.logrotate" "$pkgdir/etc/logrotate.d/mhuxd"
	install -Dm 644 "mhuxd.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm 644 "mhuxd.sysusers" "$pkgdir/usr/lib/sysusers.d/mhuxd.conf"
	install -Dm 644 "mhuxd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mhuxd.conf"
	install -Dm 644 "kernel-modules.conf" "$pkgdir/etc/modules-load.d/mhuxd.conf"

	# TODO: Tighten the security a bit. No need to open all tty ports
	# (by adding the mhuxd user to uucp group), when we can do it
	# specifically only for microKeyer.

}
