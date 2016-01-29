# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=mathopd
pkgver=1.6b15
pkgrel=5
pkgdesc="A very small, yet very fast HTTP server for UN*X systems"
arch=(i686 x86_64)
url="http://www.mathopd.org/"
license=('BSD')
install=("$pkgname.install")
source=("https://github.com/michielboland/$pkgname/archive/$pkgver.tar.gz"
$pkgname.service
'http://www.mathopd.org/doc/mathopd.8.gz'
'http://www.mathopd.org/doc/mathopd.conf.5.gz'
$pkgname.install
)
md5sums=('72846a59c493aee3ee354c4186a53dab'
         'b4b82f359010e8109b1ea86ecd87eb8b'
         'dd645079a41380fbb301da6d5559de84'
         '11092a3c42c38d8a851a7807b6576349'
         'fe0e93eb8287a296ff2eccc1550fd9a4')
backup=("etc/$pkgname/$pkgname.cfg")

build() {
	cd "$pkgname-$pkgver"/src
	PREFIX=/usr SBINDIR=/usr/bin make
}

package() {
	cd "$pkgname-$pkgver"
	
	msg2 'Installing the config file...'
	install -TDm644 doc/sample.cfg $pkgdir/etc/$pkgname/$pkgname.cfg
        # config file
	sed \
	 -e 's/^User daemon$/User nobody/' \
	 -e 's!/var/mathopd/log!/var/log/mathopd!g' \
	 -i $pkgdir/etc/$pkgname/$pkgname.cfg
	
	msg2 'Creating a log directory...'
	install -o nobody -g nobody -d $pkgdir/var/log/$pkgname
	mkdir -m755 -p $pkgdir/{etc,usr/{bin,share/doc/$pkgname}}
	
	msg2 'Copying document files...'
	cp ./doc/* $pkgdir/usr/share/doc/$pkgname
		
	msg2 'Installing the rest of file...'
	# license
	install -Dm644 ./COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
	cd ./src
        # binary	
	make PREFIX=/usr SBINDIR=/usr/bin DESTDIR="$pkgdir/" install
	
	msg2 'Installing systemd service...'
	install -TDm 644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

	# man pages
	install -Dm644 $srcdir/$pkgname.conf.5.gz $pkgdir/usr/share/man/man5/$pkgname.conf.5.gz
	install -Dm644 $srcdir/$pkgname.8.gz $pkgdir/usr/share/man/man8/$pkgname.8.gz
}
