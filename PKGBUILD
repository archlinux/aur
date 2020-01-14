# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
pkgname='cloudprint-cups'
pkgver='20160502.r16.g1f27903'
_commit='1f279036fad249efa8a2bca7f8f54adffd3b59c8'
pkgrel='3'
epoch='1'
pkgdesc='Google Cloud Print driver for CUPS, allows printing to printers hosted on GCP'
arch=('any')
url='https://github.com/simoncadman/CUPS-Cloud-Print'
license=('GPL3')
depends=('cups' 'ghostscript' 'imagemagick' 'python2' 'python2-httplib2' 'python2-pycups' 'python2-six')
install="$pkgname.install"
_branch='capabilities-fix'
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/$_branch.tar.gz")
sha256sums=('13ac78b7c6941ac4479621e1594bcc6e23c01e64986cf5c84b00bae621fe27cb')

_sourcedirectory="CUPS-Cloud-Print-$_branch"

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
