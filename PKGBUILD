# Maintainer: crt <crt@archlinux.email>
pkgname=discord-irc
_npmname='discord-irc'
pkgver=2.5.0
pkgrel=1
pkgdesc="Connects Discord and IRC channels by sending messages back and forth"
url="https://github.com/reactiflux/discord-irc"
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
install=install
backup=('etc/discord-irc/conf.json')
source=(
  "http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz"
  "system.service"
)
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('8a4929a8311cfdefa26337385392c45552d158fc3d1ead8d8a0ed15d020d0af4'
            'SKIP')

package() {
  local _etc="$pkgdir/etc/$pkgname"
  export NODE_ENV=production

  npm install -g discord-irc --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  echo "/etc/discord-irc" > "$pkgdir/usr/lib/node_modules/$_npmname/.discord-irc_home"

  install -dm700 "$_etc"
  install -Dm600 \
    "$pkgdir/usr/lib/node_modules/$_npmname/conf.json" \
    "$_etc/conf.json"

  install -Dm644 "$srcdir/system.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  install -D -m644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    grep -FRlZ "$startdir" "$pkgdir" | \
    xargs -0 -- sed -i "s|$startdir|/tmp/build|g"
}
