# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=direwolf
pkgver=1.3
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
        'direwolf.service'
        'direwolf-kiss.service')
sha1sums=('93201580ac2b8832bbcad2fca4438332710e4090'
          'f94b193a8e49bae073de3cedff4394821d6148fa'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')
sha256sums=('9a1a151b42d5e83d306d04d56353826447d62e6e56d7ef162db4d5be4a0c0a86'
            '5a4bee3543da1bbe9cd8bd5edb3bb9b502728841c4c34da332a19f34f876a140'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < ../Makefile.patch
}

build() {
	cd "$pkgname-$pkgver"
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
	make INSTALLDIR="$pkgdir/usr" install

	mkdir -p "$pkgdir/etc/direwolf"
	install -D -m 644 direwolf.conf "$pkgdir/etc/direwolf/direwolf.conf"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -D -m 644 ../direwolf.service "$pkgdir/usr/lib/systemd/system"
	install -D -m 644 ../direwolf-kiss.service "$pkgdir/usr/lib/systemd/system"
}
