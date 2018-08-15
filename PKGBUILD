pkgname=netplug
pkgver=1.2.9.2
pkgrel=4
pkgdesc="A Linux daemon that manages network interfaces in response to network cables being plugged in and out"
arch=('i686' 'x86_64')
url="https://www.red-bean.com/~bos/"
license=('GPL2')
depends=('iproute2>=2.4.7')
backup=("etc/$pkgname.d/${pkgname}d.conf"
        "etc/$pkgname.d/$pkgname")
source=("$url$pkgname/$pkgname-$pkgver.tar.bz2"
        "http://src.fedoraproject.org/rpms/$pkgname/raw/main/f/${pkgname}d.service"
        "http://src.fedoraproject.org/rpms/$pkgname/raw/main/f/$pkgname-$pkgver-man.patch")
sha256sums=('5180dfd9a7d3d0633a027b0a04f01b45a6a64623813cd48bd54423b90814864e'
            '44a7891fb8b322e51019220edafa9255ca18591867469ade554fefe2a93d6a40'
            '656a2bebd65ce5f929def9196223b8a9b2876031f5348972cfd5d92fb1a41cd4')

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
	install -Dp -m644 {"$srcdir","$pkgdir/"usr/lib/systemd/system}/${pkgname}d.service
}

# vim: set ft=sh ts=4 sw=4 noet:
