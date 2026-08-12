# Maintainer: HaoCheng <ch1994@outlook.com>
_pkgname=unblockneteasemusic
pkgname=$_pkgname-git
pkgver=r1396.39e21bf
pkgrel=1
pkgdesc="Revive unavailable songs for Netease Cloud Music"
provides=($_pkgname)
arch=("any")
url=https://github.com/UnblockNeteaseMusic/server
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
backup=(etc/unblockneteasemusic/args.conf)
provides=("unblockneteasemusic")
depends=('nodejs>=21.3')
optdepends=('yt-dlp')
conflicts=(
	"nodejs-unblockneteasemusic"
	"netease-cloud-music-unblock-enhanced-git"
	"unblockneteasemusic"
)
source=(
	$_pkgname::git+$url.git#branch=enhanced
	$_pkgname.sh
	$_pkgname.service
	$_pkgname.sysusers
	args.conf
)
sha256sums=('SKIP'
            'cf9427d8f15024143ba2b0d5992fd33f4817b1ff162a538e31da53c02e404935'
            'a10419b2f0618e664c1663851b2cd627c4da7026287718619706d723d968ec72'
            '59dc25365cc6ea9e0f0e4e2b66b8b079eb74d542c5548c1c1b2722aef2f94270'
            '2eeb1f943cecb2eaea9fa4eaf3f3e0663e4ea754d1e9b0967abe590e6e2c8573')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "$srcdir/$_pkgname/precompiled/app.js" "$pkgdir/usr/lib/$_pkgname/app.js"
	install -Dm755 "$srcdir/$_pkgname/server.crt" "$pkgdir/etc/$_pkgname/server.crt"
	install -Dm755 "$srcdir/$_pkgname/server.key" "$pkgdir/etc/$_pkgname/server.key"
	install -Dm755 "$srcdir/$_pkgname/ca.crt" "$pkgdir/usr/share/ca-certificates/trust-source/anchors/$_pkgname.crt"
	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm644 "$srcdir/args.conf" "$pkgdir/etc/unblockneteasemusic/args.conf"
	install -Dm644 "$srcdir/$_pkgname/COPYING" "$srcdir/$_pkgname/COPYING.LESSER" -t "$pkgdir/usr/share/licenses/$pkgname"
}
