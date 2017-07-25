pkgname=sniproxy
pkgver=0.5.0
pkgrel=1
pkgdesc="TLS SNI proxy"
arch=(i686 x86_64)
url="https://github.com/dlundquist/sniproxy"
license=('BSD')
depends=(libev pcre udns)
backup=('etc/sniproxy.conf')
install=sniproxy.install
source=($pkgname-$pkgver.tar.gz::https://github.com/dlundquist/sniproxy/archive/$pkgver.tar.gz
	sniproxy.service
	sniproxy.conf
	sniproxy.tmpfiles.d)
sha256sums=('0b8dd06f9aa9e1c4151b572caf645ffceacdd35a139ded16a7fb0035452c17e5'
            '652e7f9e605fd24bb0c45c2227b8ed32d7c4b219066da0b0dc6fc0b87500d908'
            'b199717c01176c7d38e6508b049d2aa12a440a2d1a28039b03fd0b060b00058c'
            'a0ded4090c83f50457e5521773d87a33821781055eb5dee503cf69388ff5b207')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm0644 $srcdir/sniproxy.conf $pkgdir/etc/sniproxy.conf
	install -Dm0644 $srcdir/sniproxy.tmpfiles.d $pkgdir/usr/lib/tmpfiles.d/sniproxy.conf
	install -Dm0644 sniproxy.conf $pkgdir/usr/share/doc/$pkgname/sniproxy.conf
	install -Dm0644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
	install -Dm0644 $srcdir/sniproxy.service $pkgdir/usr/lib/systemd/system/sniproxy.service
}
