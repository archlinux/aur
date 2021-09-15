# Maintainer: AK <crt@archlinux.email>
pkgname=discord-irc
_npmname='discord-irc'
pkgver=2.9.0
pkgrel=1
pkgdesc="Connects Discord and IRC channels by sending messages back and forth"
url="https://github.com/reactiflux/discord-irc"
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
install=install
backup=('etc/discord-irc/config.json')
source=(
  "http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz"
  "system.service"
)
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('d68e140ef09455596109e8d8cc79c0992b81a3205e5b541abe41472466c51d65'
            '32c517a078299bc528d69aa29b30f2c8bb79e617aab177da1bafc8117763f669')

package() {
  local _etc="$pkgdir/etc/$pkgname"
  export NODE_ENV=production

  npm install -g discord-irc --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  echo "/etc/discord-irc" > "$pkgdir/usr/lib/node_modules/$_npmname/.discord-irc_home"

  install -dm700 "$_etc"
  install -Dm600 \
    "$pkgdir/usr/lib/node_modules/$_npmname/package.json" \
    "$_etc/config.json"

  install -Dm644 "$srcdir/system.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  install -D -m644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
