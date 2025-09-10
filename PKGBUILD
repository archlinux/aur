# Maintainer: Rigel Kent <sendmemail at rigelk dot eu>
# Maintainer: Pierre-Alain TORET <pierre-alain.toret at protonmail dot com>
pkgname=peertube
pkgver=7.3.0
pkgrel=1
pkgdesc="ActivityPub-federated video streaming platform using P2P directly in your web browser"
arch=("x86_64")
url="https://joinpeertube.org/"
license=("AGPL")
depends=("nodejs>=14" "ffmpeg>=4.4.1" "postgresql" "python-pip" "openssl" "redis" "npm" "yarn")
makedepends=("yarn" "python" "git")
backup=("etc/peertube/production.yaml")
#options=("!strip")
source=("https://github.com/Chocobozzz/PeerTube/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"
        "https://github.com/Chocobozzz/PeerTube/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz.asc"
        "$pkgname.tmpfiles"
        "$pkgname.sysusers"
        "$pkgname")
b2sums=('972d63d8121d3ba01e3639c6d425636144fe87755d5cc090c40d3a41f887fe15282c7fca71d55ae60bce03230e4a8cd71c52e4e27708c6720d80056f33b33994'
        '681f13d96b02cd281350e64515d72ada915e849f3f3364a4bd794c7060642df44e1032b9887cc135c81d1eb3291997d4065725ca284b1770c135085c23759639'
        '10531710848bf58892fb0cefc3bc08b63b05231ece16cb143c2eae48d2d6d6c64613cf72303116701ece32b64cdbe64acffeca25030a4f2edde26f29de0360d0'
        '287a1a1b8f279b4f50d02f73b8069c39c49e6d79917f912f6f57db900064b34de91af0a5c0ee2fd743d130dc07e557b582222351491b605c7f5982c03b84b4c3'
        '8c90b7433651fc7e21bb641ec1771bd9a4186b4c88502ab7a74becfe3515f0fd84e8dfccdb5e450a3580f5bc3a9722c4a9246d0233218b47307c6ac542170171')
validpgpkeys=(C44AAD638367912CA93EDD57583A612D890159BE)

build() {
  cd "$pkgname-v$pkgver"
  yarn install --production --pure-lockfile
}

package() {
  install -d "$pkgdir/usr/share/webapps"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  install -Dm644 "$pkgname-v$pkgver/config/default.yaml" "$pkgdir/etc/$pkgname/default.yaml"
  install -Dm644 "$pkgname-v$pkgver/config/production.yaml.example" "$pkgdir/etc/$pkgname/production.yaml"
  sed -i  "s@/var/www/$pkgname@/var/lib/$pkgname@g" "$pkgdir/etc/$pkgname/production.yaml"

  install -Dm644 "$pkgname-v$pkgver/CREDITS.md" "$pkgdir/usr/share/doc/$pkgname/CREDITS"
  install -Dm644 "$pkgname-v$pkgver/FAQ.md" "$pkgdir/usr/share/doc/$pkgname/FAQ.md"
  install -Dm644 "$pkgname-v$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -a "$pkgname-v$pkgver/support/doc" "$pkgdir/usr/share/doc/$pkgname"

  install -Dm644 "$pkgname-v$pkgver/support/systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  sed -i "s@redis-server@redis@;s@/var/www/$pkgname/config@/etc/$pkgname@;s@/var/www/$pkgname/$pkgname-latest@/usr/share/webapps/$pkgname@;s@ProtectSystem=full@ProtectSystem=true@" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf "$pkgname-v$pkgver"/{config,*.md,LICENSE}
  cp -a "$pkgname-v$pkgver" "$pkgdir/usr/share/webapps/$pkgname"
}
