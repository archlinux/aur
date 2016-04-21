# Maintainer: Your Name <youremail@domain.com>
pkgname=earlyoom
pkgver=0.10
pkgrel=3
pkgdesc="Early OOM Daemon for Linux"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
source=(
	"https://github.com/florianjacob/$pkgname/archive/v$pkgver.tar.gz"
)
md5sums=('da4e9939aee80e31f8ea63c8e8ce1f38')

build() {
	cd "$pkgname-$pkgver"
	# earlyoom tries to get the version number from the git repo, but we're packaging tarballs here, so that would fail.
	make VERSION=$pkgver
}

package() {
	cd "$pkgname-$pkgver"

	# earlyoom's install script doesn't support a staged build or prefix configuration, so do this by hand.
	install -D -m 755 ./earlyoom "${pkgdir}/usr/bin/earyloom"
	install -D -m 644 ./earlyoom.service "${pkgdir}/usr/lib/systemd/system/earlyoom.service"
	sed -i s~/usr/local/bin/earlyoom~/usr/bin/earlyoom~g "${pkgdir}/usr/lib/systemd/system/earlyoom.service"
}
