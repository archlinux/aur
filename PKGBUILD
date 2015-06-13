# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: SakalisC <chrissakalis (gmail)>
# Maintainer: SanskritFritz (gmail)

pkgname=logkeys
pkgver=0.1.1a
pkgrel=12
pkgdesc="Simple keylogger supporting also USB keyboards."
license=('GPLv3')
arch=('i686' 'x86_64')
optdepends=('logkeys-keymaps: for additional keymaps')
url="http://logkeys.googlecode.com/"
install="logkeys.install"
backup=('etc/conf.d/logkeysd')
source=("http://logkeys.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        logkeys-stdout.patch logkeysd.conf logkeys.service)

md5sums=('19362a382b65e89c66ea4c5642297589'
         'c11258ab13560081c2cdb56ccd31c6cd'
         'c05608a47e303e8f604f46d1ed22aa4a'
         'bd70a5e5601168bbf7bf7f91ee530d14')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < "$srcdir/logkeys-stdout.patch"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make prefix="$pkgdir/usr" install
	# File (/usr/etc/) in a non-standard directory (those scripts are useless anyway).
	rm -rf "$pkgdir/usr/etc/"

	install -Dm0644 "$srcdir/logkeysd.conf" "$pkgdir/etc/conf.d/logkeysd"
	install -Dm0644 "$srcdir/logkeys.service" "$pkgdir/usr/lib/systemd/system/logkeys.service"
}
