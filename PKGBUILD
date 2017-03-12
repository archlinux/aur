pkgname=parprouted
pkgver=0.7
pkgrel=3
pkgdesc="daemon for transparent IP (Layer 3) proxy ARP bridging"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://freecode.com/projects/parprouted"
license=('GPL2')
depends=('iproute')
source=("http://www.hazard.maks.net/parprouted/parprouted-$pkgver.tar.gz"
	"000-routecmd.diff"
	"parprouted.conf"
	"parprouted.service")

sha512sums=('c55d50dc7fc90ca108989a47a4b6f02509c0f3c72d13c9cc81cde27f56cce3dba4af74724a372395aae00c390222c9d53a604b61d6bd5af907124345b1b5e64f'
            '664f15b19f2a8ce7fa6ee3c251c62274df0d4bb7426cbad769affcafc5e68d288d1617953a6f3dd07aea699c167deaa423ae5c2b293fd32ce0f97144c5fd6a1a'
            'fcb0e60618cf3d42baf175a5b318de6ef8d271f0993d5e77492698141740d2dd8fdfe8c093105ef48d5ecbb36c674027ab80d838222ef73e3a526f91b86ab64e'
            '5261d784a5418f10d4ae6c5223537651d2a3cb8546e85e7095c524d1b5233b4e06c56cf9ca864d48f607de34064fdfd99296e9ff1fa2405e718a7b34e7812ccd')

build() {
	cd parprouted-$pkgver
	patch -p1 < ../000-routecmd.diff
	make CFLAGS+=' -DROUTE_CMD=\"/usr/bin/ip\"'
}

package() {
	install -Dm0755 "parprouted-$pkgver"/parprouted $pkgdir/usr/bin/parprouted
	install -Dm0644 "parprouted-$pkgver"/parprouted.8 $pkgdir/usr/share/man/man8/parprouted.8
	install -Dm0644 "$startdir"/parprouted.service "$pkgdir"/usr/lib/systemd/system/parprouted.service
	install -Dm0644 "$startdir"/parprouted.conf "$pkgdir"/etc/conf.d/parprouted
}
