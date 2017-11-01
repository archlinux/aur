# Maintainer: Simon Doppler <dop.simon@gmail.com>
# Original maintainer: Johannes Löthberg <johannes@kyriasis.com>

_projname=ArchMap
pkgname=archmap-git
pkgver=0.4.r2.g819a0c4
pkgrel=2

provides=('archmap')
conflicts=('archmap')

pkgdesc="Generates a map of Arch Linux users"
arch=('any')
url="https://github.com/guyfawcus/ArchMap/"
license=('custom:UNLICENSE')

depends=('python-geojson' 'python-simplekml' 'python-beautifulsoup4')
makedepends=('git' 'python-sphinx')

install=archmap-git.install
source=("archmap::git+https://github.com/maelstrom59/${_projname}.git")
md5sums=('SKIP')

pkgver() {
	cd archmap
	git describe --tags | sed 's/^v//; s/-/-r/; s/-/./g'
}

build() {
	cd archmap/docs
	make man
}

package() {
	cd archmap
	install -D archmap.py "$pkgdir/usr/bin/archmap"

	install -d "$pkgdir/usr/lib/systemd/system"
	install -m644 systemd/archmap.{service,timer} "$pkgdir/usr/lib/systemd/system/"

	install -d "$pkgdir/usr/share/doc/archmap"
	install {README.rst,archmap.conf} "$pkgdir/usr/share/doc/archmap"

	install -D docs/_build/man/archmap.1 "$pkgdir/usr/share/man/man1/archmap.1"

	install -D -m644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
