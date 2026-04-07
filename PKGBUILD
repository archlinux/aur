# Maintainer: Rigel Kent <sendmemail at rigelk dot eu>
# Maintainer: Pierre-Alain TORET <pierre-alain.toret at protonmail dot com>
pkgname=peertube
pkgver=8.1.5
pkgrel=1
pkgdesc="ActivityPub-federated video streaming platform using P2P directly in your web browser"
arch=("x86_64")
url="https://joinpeertube.org/"
license=("AGPL")
depends=("nodejs>=14" "ffmpeg>=4.4.1" "postgresql" "python-pip" "openssl" "redis" "npm" "yarn")
makedepends=("pnpm" "python" "git")
backup=("etc/peertube/production.yaml")
#options=("!strip")
source=("https://github.com/Chocobozzz/PeerTube/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"
        "https://github.com/Chocobozzz/PeerTube/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz.asc"
        "$pkgname.tmpfiles"
        "$pkgname.sysusers"
        "$pkgname")
b2sums=('25106e8b9cc6e96abf7545d8acc990c63b51d5f55481cd0e22782f028b763bce31ae3bbdf41abc7ad12f7c960a6f720b3ccf43a6c1284795124eb5a880314f0c'
        '8b7f32037f9d73758d5e0aa3ee94faf345bb5ca03480d6ca0f3d275d59e0bd37e230ebd409a9f06274f31b50b8c6ce4a6fed91d02ae71821087ab15c2d0b589a'
        '10531710848bf58892fb0cefc3bc08b63b05231ece16cb143c2eae48d2d6d6c64613cf72303116701ece32b64cdbe64acffeca25030a4f2edde26f29de0360d0'
        '287a1a1b8f279b4f50d02f73b8069c39c49e6d79917f912f6f57db900064b34de91af0a5c0ee2fd743d130dc07e557b582222351491b605c7f5982c03b84b4c3'
        '8c90b7433651fc7e21bb641ec1771bd9a4186b4c88502ab7a74becfe3515f0fd84e8dfccdb5e450a3580f5bc3a9722c4a9246d0233218b47307c6ac542170171')
validpgpkeys=(C44AAD638367912CA93EDD57583A612D890159BE)

build() {
  cd "$pkgname-v$pkgver"
  rm -rf ./node_modules ./client/node_modules ./client/.angular 
  npm run install-node-dependencies -- --production
  pnpm store prune
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
