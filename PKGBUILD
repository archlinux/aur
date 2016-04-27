# Maintainer: Radek Podgorny <radek@podgorny.cz>
pkgname=hostsblock-git
provides=('hostsblock')
conflicts=('hostsblock')
pkgver=r78.1584916
pkgrel=1
pkgdesc="A script and cronjob that downloads, sorts, and installs multiple ad- and malware-blocking hosts files."
arch=('any')
url="http://gaenserich.github.com/hostsblock/"
license=('GPL')
depends=('bash' 'curl' 'grep' 'sed' 'coreutils')
optdepends=(
	'dnsmasq: helps speed up DNS resolutions'
	'pixelserv: removes boilerplate page on blocked urls'
	'kwakd: removes boilerplate page on blocked urls (recommended)'
	'unzip: allows the use of zipped downloads'
	'p7zip: allows the use of 7zipped downloads'
	'gzip: allows compression of old blockfile'
)
makedepends=('git')
backup=('etc/hostsblock/hostsblock.conf' 'etc/hostsblock/black.list' 'etc/hostsblock/white.list' 'etc/hostsblock/hosts.head')
install=hostsblock.install
source=('git+https://github.com/gaenserich/hostsblock')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/hostsblock"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $srcdir/hostsblock
	install -Dm744 src/hostsblock.sh "$pkgdir"/usr/bin/hostsblock
	install -Dm744 src/hostsblock-urlcheck.sh "$pkgdir"/usr/bin/hostsblock-urlcheck
	install -Dm644 src/hostsblock-common.sh "$pkgdir"/usr/lib/hostsblock-common.sh
	install -Dm644 conf/hostsblock.conf "$pkgdir"/etc/hostsblock/hostsblock.conf
	install -Dm644 conf/black.list "$pkgdir"/etc/hostsblock/black.list
	install -Dm644 conf/white.list "$pkgdir"/etc/hostsblock/white.list
	install -Dm644 conf/hosts.head "$pkgdir"/etc/hostsblock/hosts.head
	install -Dm644 systemd/hostsblock.service "$pkgdir"/usr/lib/systemd/system/hostsblock.service
	install -Dm644 systemd/hostsblock.timer "$pkgdir"/usr/lib/systemd/system/hostsblock.timer
}
