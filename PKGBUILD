# Maintainer: darkelectron <darkelectron(at)mailfence.com>
# Maintainer: Lukas Michel <lgm(dot)aur(at)outlook(dot)de
# Contributor: Uladzimir Panasiuk <v.s.panasyuk+AUR(at)gmail.com>
pkgname=epson-printer-utility
pkgver=1.1.2
pkgrel=2
pkgdesc='This is a Printer Utility program for Epson. Using this software, you can check ink levels, view error and other status... on EPSON Printers.'
arch=('x86_64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('LGPL' 'custom:Epson License Agreement')
options=('strip')
depends=('qt5-base' 'ld-lsb=3')
install="$pkgname.install"
source=("https://download3.ebz.epson.net/dsc/f/03/00/14/68/92/d73ac45cccd3c5c349dbe365b5e99ae3112cbe49/${pkgname}_${pkgver}-1_amd64.deb"
  'ecbd.service'
  'LICENSE'
  'AVASYSPL.en.txt'
  "$pkgname.install"
  "$pkgname.desktop")
sha256sums=('c34c08476ab185f8fd339e9681a3697cdb3c2e85d454be2aaed11e40b09aedff'
            '8cc99a3e68b3367f4a78c05b93fdbbdcded13302fac72daf20b5a0ec9c6c9d55'
            'e1bb0ade3e05ab06adcdecc117d2243612419b2b959c46c70db08885a4670c9e'
            'd9d156980047833ed7a5841b4fd92f6bed0146480748d8a595b8e6d0a2cd004c'
            '41d8ac5e491eebd1b2cd6e6cf48ca9d5641dd28c3cf9885bb4263aec31fd03a0'
            '6b1a03f8924c149e926d3071d111549f32c134a4fdebe00b3bfe4585e4b70e94')

prepare() {
	[ -d data ] && rm -rf data
	mkdir data
	cd data
	for datatar in ../data.tar.*; do
		echo "Unpacking $datatar"
		tar -xf $datatar
	done
}

package() {
	mkdir -p $pkgdir/opt/$pkgname
	cp -dr --no-preserve=ownership,mode $srcdir/data/opt/$pkgname/{lib,resource} $pkgdir/opt/$pkgname
	install -Dm 755 $srcdir/data/opt/$pkgname/bin/$pkgname $pkgdir/opt/$pkgname/bin/$pkgname

	#mkdir -p $pkgdir/usr/lib/
	#cp -dr --no-preserve=ownership,mode $srcdir/data/usr/lib/cups $pkgdir/usr/lib/

	install -Dm 755 $srcdir/data/usr/lib/epson-backend/ecbd $pkgdir/opt/$pkgname/lib/epson-backend/ecbd

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/$pkgname/bin/$pkgname $pkgdir/usr/bin/$pkgname

	install -Dm644 $srcdir/ecbd.service $pkgdir/usr/lib/systemd/system/ecbd.service
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

	for f in LICENSE AVASYSPL.en.txt; do
		install -Dm644 $srcdir/$f $pkgdir/usr/share/licenses/$pkgname/$f
	done
}
