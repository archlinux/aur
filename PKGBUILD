# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=tlf-git
_pkgname=tlf
_author=Tlf
pkgver=1.4.1.r245.g2b5c837
#.r1.g3535aa1
pkgrel=2
pkgdesc="Ham Radio networked logging and contest program - CLI"
arch=('i686' 'x86_64')
url="https://tlf.github.io/"
license=('GPL')
depends=('xfce4-terminal' 'hamlib-git' 'xmlrpc-c' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'pkg-config')
optdepends=('cwdaemon: transmitting cw'
	    'winkeydaemon: transmitting cw'
	    'cty: country files'
	    'joe: editing qsos'
	    'xplanet: mapped qso display'
	    'sox: audio signal handling'
	    'fldigi: digital modes/modem & gui/display')
provides=('tlf')
conflicts=('tlf')
source=("$_pkgname::git+https://github.com/$_author/$_pkgname.git#branch=master"
	$_pkgname.desktop
	$_pkgname.png
	$_pkgname.1)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^tlf-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_pkgname

	autoreconf --install

	CFLAGS=-Wno-error ./configure --prefix=/usr --enable-hamlib\
	 --enable-fldigi-xmlrpc

	make || return 1
}

package() {
	cd $srcdir/$_pkgname

	make prefix=$pkgdir/usr datadir=$pkgdir/usr/share install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$_pkgname $pkgdir/usr/bin/$_pkgname.1
	install -D -m 755 ../$_pkgname.1 $pkgdir/usr/bin/$_pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$_pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$_pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('SKIP'
         'ace42b89f5e7a686e4adc8b457f266f7'
         'f148583e02660cb430f638fd8f71f452'
         'b706428f41d32bd5f4f6f671057638c0')
sha256sums=('SKIP'
            'babe8eeda21b9d55966ef74fcf7aa2eef50317b94576f271e5d5ff580f9f5327'
            '0ddcde4f0dfa98540d4314660108ed49bfa0bc3d8b87cb46906dfd6f12be2497'
            '766253a6f4b1d7e0526366875a46e220d637665c3c44e551f8d3db4ed88aaf81')
