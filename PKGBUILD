# Maintainer: Andrew Hills <ahills@ednos.net>
pkgname=beard
pkgver=0.4
pkgrel=1
pkgdesc="A simple hibernation daemon"
arch=('any')
url="https://github.com/ahills/$pkgname"
license=('custom:unlicense')
depends=('pm-utils' 'coreutils' 'util-linux' 'syslog-ng')
backup=('etc/conf.d/beard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        beard.service)
sha512sums=('fbc09780d64543ff3a95315f3766f633ba23bc1c09943dd378be113f5b0b6dfb6bf35e069809e56fb6cea57c12e6998f6984a4ff0cff31462689975527f13aa7'
            '575b815a9eccbe50eb3df1e68efc02bb0cc0cd98db0c6117ca2677af198d36f333e1501039f5559fe8f08a360dcb92fce27d3ea73d9bab3030dc5b7a79dddaeb')
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
