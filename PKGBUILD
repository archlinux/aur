# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
pkgname=earlyoom
pkgver=1.2
pkgrel=2
pkgdesc="Early OOM Daemon for Linux"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
makedepends=('pandoc')
backup=("etc/default/earlyoom")
source=(
	"https://github.com/rfjakob/$pkgname/archive/v$pkgver.tar.gz"
)
sha256sums=('ce4e8b435eda9bd1427b6606558356249486a405850b9869c0006e7fbd454c5f')

build() {
	cd "$pkgname-$pkgver"
	# earlyoom tries to get the version number from the git repo, but we're packaging tarballs here, so that would fail.
	make VERSION=$pkgver
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}"
	PREFIX="/usr"
	SYSTEMDDIR="${PREFIX}/lib/systemd"
	export DESTDIR
	export PREFIX
	export SYSTEMDDIR

	make install
	# make install doesn't install the manpage for some reason
	install -Dm644 earlyoom.1.gz "${DESTDIR}${PREFIX}/share/man/man1/earlyoom.1.gz"
}
