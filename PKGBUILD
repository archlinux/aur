# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
pkgname=nodejs-unblockneteasemusic
pkgver=0.21.0
pkgrel=1
pkgdesc="Revive unavailable songs for Netease Cloud Music"
arch=(any)
url=https://github.com/nondanee/UnblockNeteaseMusic
license=(MIT)
depends=(nodejs)
makedepends=(npm jq)
source=(
	$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
	unblockneteasemusic.service
	args.conf
)
sha512sums=(
	8120eb8038a175d8c523fbd057c05f10fc01573f6b6079ea02ca2d3eccfbbb819cf31100f0ec3723ff8d0e569b3b4087a7e916a476f557f93d95697fccd14822
	c69b0fd75f456bddfc570c5919742640ccee1ec7a291d92157d1e5b56b49eb0c185b7b0fc063f96be6aa03f2265ff2aec170fef555964b260cd5c58775e7b680
	bbf170413150b9eab5fe996f213ca2e454f7acac7ce64c39a70e8ae4a2e2fb5a467b5a253898e0f488a272dfde2060310d7ebff958390dd918510bda764a65be
)
package() {
	npm install -g --user root --prefix "$pkgdir/usr" -cache  "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tar.gz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} \;
	chown -R root:root "$pkgdir"
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i "/_where/d"
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/@nondanee/unblockneteasemusic/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	install -Dm644 "$srcdir/unblockneteasemusic.service" "$pkgdir/usr/lib/systemd/system/unblockneteasemusic.service"
	install -Dm644 "$srcdir/args.conf" "$pkgdir/etc/systemd/system/unblockneteasemusic.service.d/args.conf"
}
