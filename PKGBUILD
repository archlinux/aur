# Co-Maintainer: David Thurstenson thurstylark@gmail.com
# Co-Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Erez Raviv (erezraviv@gmail.com)
# Contributor: Mathew Hiles (matthew.hiles@gmail.com)
# Contributor: Nicholas Tryon (KC2YTG) <dhraak at gmail dot com>

pkgname=chirp-hg
_pkgname=chirp
pkgver=20170415
pkgrel=1
pkgdesc="GUI tool for programming Ham Radios - HG/Complete version"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL3')
depends=('python2-lxml' 'python2-pyserial' 'pygtk' 'hamradio-menus')
makedepends=('mercurial')
options=('!emptydirs')
provides=('chirp')
conflicts=('chirp-daily')
install=$_pkgname.install
source=("$_pkgname::hg+http://d-rats.com/hg/$_pkgname.hg")

pkgver() {
	cd $srcdir/$_pkgname

	date +%Y%m%d 
}

prepare() {
	cd $srcdir/$_pkgname

	sed -i -e 's|/usr/sbin|/usr/bin|g' setup.py
	sed -i 's:python:python2:' chirpc

	date +%Y%m%d > build/version
	export VERSION=$(cat build/version)
	sed -i -e 's/^CHIRP_VERSION.*$/CHIRP_VERSION=\"'$VERSION'-arch-dev\"/' chirp/__init__.py
}

build() {
	cd $srcdir/$_pkgname

	python2 setup.py build
}

package() {
	cd $srcdir/$_pkgname

	python2 setup.py install --root="$pkgdir/" --optimize=1

	install -m755 chirpc $pkgdir/usr/bin

	rm -rf $pkgdir/usr/share/doc/$_pkgname/COPYING
	install -m644 README.chirpc $pkgdir/usr/share/doc/$_pkgname
	install -m644 README.rpttool $pkgdir/usr/share/doc/$_pkgname
}
md5sums=('SKIP')
sha256sums=('SKIP')
