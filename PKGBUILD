# Maintainer: Uladzimir Panasiuk <v.s.panasyuk(at)gmail.com>

pkgname=epson-printer-utility
pkgver=1.0.2
pkgrel=2
pkgdesc='This is a Printer Utility program for Epson. Using this software, you can check ink levels, view error and other status... on EPSON Printers.'
arch=('x86_64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('LGPL' 'custom:Epson Licence Agreement')
options=('!strip')
depends=('qt4'
         'ld-lsb=3')
install=$pkgname.install
source=("https://download3.ebz.epson.net/dsc/f/03/00/09/02/33/71b2905a4cdf07374e83281333a767b24b57bc2d/${pkgname}_${pkgver}-1lsb3.2_amd64.deb"
  'ecbd.service'
  "$pkgname.install"
  "$pkgname.desktop")
sha256sums=('ecfe72484087bb1af5eb7ce83410f4efe96530f670a151ffeb9bad7b5b230650'
            '8cc99a3e68b3367f4a78c05b93fdbbdcded13302fac72daf20b5a0ec9c6c9d55'
            'c35c69fd16534c8e5b382e5918d921cf9a82d96b522833d50b652035f11eaa7c'
            '9ec18291dfc6b886be438883a0b8e5d3f4eb7dfc570bc4b8c9dbe5dfc1d33e9f')

prepare() {
	[ -d data ] && rm -rf data
	mkdir data
	cd data
	for datatar in ../data.tar.*; do
		msg2 "Unpacking $datatar"
		tar -xf $datatar
	done
}

package() {
	mkdir -p $pkgdir/{opt/$pkgname,usr}
	cp -dr --no-preserve=ownership,mode $srcdir/data/opt/epson-printer-utility/{lib,resource} $pkgdir/opt/epson-printer-utility
	install -Dm 755 $srcdir/data/opt/$pkgname/bin/$pkgname $pkgdir/opt/$pkgname/bin/$pkgname
	
	#mkdir -p $pkgdir/usr/lib/
	#cp -dr --no-preserve=ownership,mode $srcdir/data/usr/lib/cups $pkgdir/usr/lib/
	
	install -Dm 755 $srcdir/data/usr/lib/epson-backend/ecbd $pkgdir/opt/$pkgname/lib/epson-backend/ecbd
	
	mkdir -p $pkgdir/usr/bin
	ln -s /opt/$pkgname/bin/$pkgname $pkgdir/usr/bin/$pkgname
	
	install -Dm644 $srcdir/ecbd.service $pkgdir/usr/lib/systemd/system/ecbd.service
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

