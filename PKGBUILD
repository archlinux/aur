# Maintainer: Pierre-Alain TORET <pierre-alain.toret at protonmail dot com>
# Maintainer: Rigel Kent <sendmemail at rigelk dot eu>
pkgname=peertube
pkgver=3.0.0
pkgrel=1
pkgdesc="ActivityPub-federated video streaming platform using P2P directly in your web browser"
arch=("x86_64")
url="https://joinpeertube.org/"
license=("AGPL")
depends=("nodejs>=10" "nodejs<13" "ffmpeg" "postgresql" "openssl" "redis" "npm")
makedepends=("yarn" "python2" "git")
backup=("etc/peertube/production.yaml")
options=("!strip")
install=$pkgname.install
source=("https://github.com/Chocobozzz/PeerTube/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"
        "https://github.com/Chocobozzz/PeerTube/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz.asc"
        "$pkgname.install"
        "$pkgname.sysusers"
        "$pkgname")
b2sums=('d5177d25cb5e4fdcad1d7944e8a6f29ba66332c9404944901a3375921516f7556574253740b000c64a4c01a34aa1b42651c3460cf48e245bba81c861e212ef55'
        'SKIP'
        'ed191d2f82e9360e37e3a60704beb504363b48026ade8fb98378d34d2a890a9de27f3668438261bbc760a50c14c64ed173b9eb5ae47fa8e5dc3f10727bfe45a5'
        '287a1a1b8f279b4f50d02f73b8069c39c49e6d79917f912f6f57db900064b34de91af0a5c0ee2fd743d130dc07e557b582222351491b605c7f5982c03b84b4c3'
        '8c90b7433651fc7e21bb641ec1771bd9a4186b4c88502ab7a74becfe3515f0fd84e8dfccdb5e450a3580f5bc3a9722c4a9246d0233218b47307c6ac542170171')
validpgpkeys=(C44AAD638367912CA93EDD57583A612D890159BE)

build() {
  cd "$pkgname-v$pkgver"
  yarn install --pure-lockfile
}

package() {
  install -d "$pkgdir/usr/share/webapps"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

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
