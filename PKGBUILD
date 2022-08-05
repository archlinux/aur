# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Librewish <librewish AT gmail.com>

pkgname=prelockd
pkgver=0.9
pkgrel=2
pkgdesc="Lock executables, shared libraries in memory to improve responsiveness"
arch=('any')
url="https://github.com/hakavlad/prelockd"
license=('MIT')
depends=('python')
backup=('etc/prelockd.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sysusers.conf")
sha256sums=('bfe11818b987aa44021a47b03a0cd40beaee8552304498d18907652dc035221f'
            '160f934b59f69de6d7915ea2afdc47fa05ec7c08b9577017a6ec1a36d322bc3c')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i '38d;46d' Makefile
}

package() {
	cd "$pkgname-$pkgver"
	make \
		DESTDIR="$pkgdir" \
		PREFIX="/usr" \
		SBINDIR="/usr/bin" \
		SYSCONFDIR="/etc" \
		SYSTEMDUNITDIR="/usr/lib/systemd/system" \
		base units
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
