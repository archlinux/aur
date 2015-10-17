# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=direwolf
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="Dire Wolf is a software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wb2osz/direwolf"
license=('GPL')
depends=('alsa-lib' 'gpsd')
makedepends=('make' 'gcc' 'patch')
source=("https://github.com/wb2osz/direwolf/archive/$pkgver.zip"
	'Makefile.patch'
	'gps.patch'
	'kiss.patch'
        'direwolf.service'
        'direwolf-kiss.service')
sha1sums=('4d543ad206a9643003836eb5ccd9bbbaf86ab560'
          '878faf112044b24070c4c8480d89535e9c345b44'
          '462d0cecb55daf230d2b59faac3822d00cf4b6fe'
          '17d1fdf760b0929a0f1de8825623b63818603b43'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	patch -p1 < ../Makefile.patch
	patch -p1 < ../gps.patch
	patch -p1 < ../kiss.patch
	make
}

check() {
	:
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	mkdir -p "$pkgdir/var/log/direwolf"
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/etc/direwolf"
	install -D -m 644 direwolf.conf "$pkgdir/etc/direwolf/direwolf.conf"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -D -m 644 ../direwolf.service "$pkgdir/usr/lib/systemd/system"
	install -D -m 644 ../direwolf-kiss.service "$pkgdir/usr/lib/systemd/system"
}
