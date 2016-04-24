# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
pkgname=earlyoom
pkgver=0.10
pkgrel=5
pkgdesc="Early OOM Daemon for Linux"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
source=(
	"https://github.com/rfjakob/$pkgname/archive/v$pkgver.tar.gz"
)
md5sums=('e5119cc19ad66c24bb3754e5487d79d0')

build() {
	cd "$pkgname-$pkgver"
	# earlyoom tries to get the version number from the git repo, but we're packaging tarballs here, so that would fail.
	make VERSION=$pkgver
}

package() {
	cd "$pkgname-$pkgver"

	# earlyoom's install script doesn't support a staged build or prefix configuration, so do this by hand.
	install -D -m 755 ./earlyoom "${pkgdir}/usr/bin/earlyoom"
	install -D -m 644 ./earlyoom.service "${pkgdir}/usr/lib/systemd/system/earlyoom.service"
	sed -i s~/usr/local/bin/earlyoom~/usr/bin/earlyoom~g "${pkgdir}/usr/lib/systemd/system/earlyoom.service"
}
