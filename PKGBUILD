# Maintainer: Filip <fila pruda com>
pkgname=milter-spamd
pkgver=0.9
pkgrel=1
pkgdesc="Sendmail milter that reject mail inline using SpamAssassin spamd."
arch=('x86_64' 'i686')
url="https://www.benzedrine.ch/milter-spamd.html"
license=('BSD')
depends=('spamassassin')
makedepends=('libmilter')

install=milter-spamd.install

source=("http://www.benzedrine.ch/$pkgname-$pkgver.tar.gz" 
        "milter-spamd.service"
	"milter-spamd.sysusers")

sha256sums=('b900b233d7c532ff34ba94688cf5241310ac498a750958d839266011791a5a6d' 
            '29378f9cf016b6908c7c800ca15cc5fa7136f37c5f343c129b9d032124388883'
            '3ca976f4a8a62bf6298b52af2b113a0413446a463d990716cddbc25b987a1d0a')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/umask(0177);/umask(0117);/' milter-spamd.c
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make -f Makefile.linux
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm755 "milter-spamd" "$pkgdir/usr/bin/milter-spamd"
	install -Dm644 "milter-spamd.8" "$pkgdir/usr/share/man/man8/milter-spamd.8"
	
	install -Dm644 "$srcdir/milter-spamd.sysusers" "$pkgdir/usr/lib/sysusers.d/milter-spamd.conf"
	install -Dm644 "$srcdir/milter-spamd.service" "$pkgdir/usr/lib/systemd/system/milter-spamd.service"
}
