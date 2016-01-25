# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=mathopd
pkgver=1.6b15
pkgrel=3
pkgdesc="A very small, yet very fast HTTP server for UN*X systems"
arch=(i686 x86_64)
url="http://www.mathopd.org/"
license=('BSD')
source=("https://github.com/michielboland/$pkgname/archive/$pkgver.tar.gz"
mathopd.service)
md5sums=('72846a59c493aee3ee354c4186a53dab'
         'b4b82f359010e8109b1ea86ecd87eb8b')
backup=("etc/$pkgname/$pkgname.cfg")

build() {
	cd "$pkgname-$pkgver"/src
	PREFIX=/usr SBINDIR=/usr/bin make
}

package() {
	cd "$pkgname-$pkgver"
	msg2 'Creating a log directory...'
	install -o nobody -g nobody -d $pkgdir/var/log/$pkgname
	mkdir -m755 -p $pkgdir/{etc,usr/{bin,share/doc/$pkgname}}
	cp ./doc/* $pkgdir/usr/share/doc/$pkgname
	install -TDm644 ./doc/sample.cfg $pkgdir/etc/$pkgname/$pkgname.cfg
	cd ./src
	make PREFIX=/usr SBINDIR=/usr/bin DESTDIR="$pkgdir/" install
	msg2 'Installing systemd service...'
	install -TDm 644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
        sed -i
	 -e 's/^User daemon$/User nobody/' \
	 -e 's!/var/mathopd/log!/var/log/mathopd!g' \
	   $pkgdir/etc/$pkgname/$pkgname.cfg
}
