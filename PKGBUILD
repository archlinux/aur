pkgname=netplug
pkgver=1.2.9.2
pkgrel=3
pkgdesc="A Linux daemon that manages network interfaces in response to network cables being plugged in and out"
arch=('i686' 'x86_64')
url="http://www.red-bean.com/~bos/"
license=('GPL2')
depends=('iproute2>=2.4.7')
backup=("etc/$pkgname.d/${pkgname}d.conf"
        "etc/$pkgname.d/$pkgname")
source=("$url$pkgname/$pkgname-$pkgver.tar.bz2"
        "http://pkgs.fedoraproject.org/cgit/$pkgname.git/plain/${pkgname}d.service"
        "http://pkgs.fedoraproject.org/cgit/$pkgname.git/plain/$pkgname-$pkgver-man.patch")
md5sums=('1d6db99536bdf875ce441f2c0e45ebf2'
         '4482ef8c71bfb0b0335e9426d2852056'
         '7c44d211426ef68af4b4896b2b870882')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < "$srcdir/$pkgname-$pkgver-man.patch"

	# Place all configuration files in the same directory (/etc/netplug.d)
	sed -e "/^etcdir ?=/ s|/etc/$pkgname|/etc/$pkgname.d|" \
	    -i Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" bindir=/usr/bin install

	# Replace default sysvinit script with a systemd unit
	rm -r "$pkgdir/"etc/rc.d
	install -D -m644 {"$srcdir","$pkgdir/"usr/lib/systemd/system}/${pkgname}d.service
}

# vim: set ft=sh ts=4 sw=4 noet:
