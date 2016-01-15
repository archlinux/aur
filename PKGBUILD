pkgname=parprouted
pkgver=0.7
pkgrel=1
pkgdesc="proxy ARP IP bridging daemon"
arch=('i686' 'x86_64' 'armv6l' 'armv7h')
url="http://freecode.com/projects/parprouted"
license=('GPL2')
depends=('iproute')
source=("http://www.hazard.maks.net/parprouted/parprouted-$pkgver.tar.gz"
	"000-routecmd.diff"
	"parprouted.conf"
	"parprouted.service")

md5sums=('570f5deaf09600df8f80f589de79ecdb'
         'c77e6b850b50a338cfc4f0c91f33b7f6'
	 'a7b194a4a67468539ccc7f776c7b3184'
	 '9d5dcdaa61630bb02c96ef32efacd766')

build() {
	cd parprouted-$pkgver
	patch -p1 < ../000-routecmd.diff
	make CFLAGS+=' -DROUTE_CMD=\"/usr/bin/ip\"'
}

package() {
	cd parprouted-$pkgver
	install -Dm0755 parprouted $pkgdir/usr/bin/parprouted
	install -Dm0644 parprouted.8 $pkgdir/usr/share/man/man8/parprouted.8
	install -Dm0644 "$srcdir"/../parprouted.service "$pkgdir"/usr/lib/systemd/system/parprouted.service
	install -Dm0644 "$srcdir"/../parprouted.conf "$pkgdir"/etc/conf.d/parprouted
}
