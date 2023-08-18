# Maintainer: Andrew Hills <ahills@ednos.net>
pkgname=beard
pkgver=0.3
pkgrel=1
pkgdesc="A simple hibernation daemon"
arch=('any')
url="https://github.com/ahills/$pkgname"
license=('custom:unlicense')
depends=('pm-utils' 'coreutils' 'util-linux' 'syslog-ng')
backup=('etc/conf.d/beard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        beard.service)
md5sums=('f4ed7478371dbaa2f2ab5a66feca91eb'
         '72a17538035df4c120c8b6fed112d78e')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	# Correct /usr/sbin to /usr/bin
	mv "$pkgdir"/usr/sbin "$pkgdir"/usr/bin

	# Makefile doesn't install these
	mkdir -p "$pkgdir"/etc/conf.d
	install -m0644 beard.conf "$pkgdir"/etc/conf.d/beard
	mkdir -p "$pkgdir"/usr/share/doc/beard
	install -m0644 README.md "$pkgdir"/usr/share/doc/beard/README.md
	mkdir -p "$pkgdir"/usr/share/licenses/beard
	install -m0644 LICENSE "$pkgdir"/usr/share/licenses/beard/LICENSE

	# systemd service file
	mkdir -p "$pkgdir"/usr/lib/systemd/system
	install -m0644 "$srcdir"/beard.service "$pkgdir"/usr/lib/systemd/system/beard.service
}
