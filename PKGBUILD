# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org> (cloudprint-cups PKGBUILD)
# Contributor: mortzu <mortzu@gmx.de>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
_pkgname='cloudprint-cups'
pkgname="$_pkgname-git"
pkgver='20160502.r16.g1f27903'
pkgrel='5'
epoch='1'
pkgdesc='Google Cloud Print driver for CUPS, allows printing to printers hosted on GCP - git version'
arch=('any')
url='https://github.com/simoncadman/CUPS-Cloud-Print'
license=('GPL3')
depends=('cups' 'ghostscript' 'imagemagick' 'python2' 'python2-httplib2' 'python2-pycups' 'python2-pyopenssl' 'python2-six' 'tk')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("$pkgname::git+$url#branch=capabilities-fix")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	./configure --prefix '/usr'
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	NOPERMS=1 make DESTDIR="$pkgdir" INSTALL='install -p' install
	python2 -O -m compileall "$pkgdir/usr/share/$_pkgname"

	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/usr/share/$_pkgname/setupcloudprint.py" "$pkgdir/usr/bin/setupcloudprint"
}
