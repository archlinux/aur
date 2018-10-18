# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=direwolf
pkgver=1.5
pkgrel=1
epoch=
pkgdesc="Dire Wolf is a software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wb2osz/direwolf"
license=('GPL')
depends=('alsa-lib' 'gpsd')
makedepends=('make' 'gcc' 'patch')
source=(
    "https://github.com/wb2osz/direwolf/archive/$pkgver.zip"
    'Makefile.patch'
    'direwolf.service'
    'direwolf-kiss.service'
)
sha1sums=('109e4119ead6ee98b952185faae059770d4292f1'
          '2b5290da15331d1cba0cef9d3607abc0441680b1'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')
sha256sums=('ef74ffd75572531ed4a93fc28bc0ccb6eb70f3315cd7df4640a784f156d8f79a'
            '66573cdd7619784dd4967bdee219619c0f12fda7c953374380f40949a5c8a9bb'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < "$srcdir/Makefile.patch"
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
	make DESTDIR="$pkgdir/usr" enable_gpsd="" install

    mkdir -p "$pkgdir/etc/udev/rules.d"
    install -D -m 644 99-direwolf-cmedia.rules "$pkgdir/etc/udev/rules.d/99-direwolf-cmedia.rules"

	mkdir -p "$pkgdir/etc/direwolf"
	install -D -m 644 direwolf.conf "$pkgdir/etc/direwolf/direwolf.conf"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -D -m 644 ../direwolf.service "$pkgdir/usr/lib/systemd/system"
	install -D -m 644 ../direwolf-kiss.service "$pkgdir/usr/lib/systemd/system"
}
