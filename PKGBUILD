# Maintainer: Martijn Heil <m.heil375@gmail.com>

pkgname=signalk-server
pkgver=1.37.5
pkgrel=1
pkgdesc="An implementation of a Signal K server."
arch=('any')
url="https://github.com/SignalK/signalk-server"
license=('Apache')
depends=('nodejs' 'npm')
makedepends=('npm')
options=(!strip)
install=signalk.install
source=("https://registry.npmjs.org/signalk-server/-/signalk-server-${pkgver}.tgz"
        'defaults.json'
        'package.json'
        'signalk-server.sysusers'
        'signalk-server.service'
        'signalk-server.socket')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
backup=('etc/signalk-server/settings.json'
        'etc/signalk-server/package.json')

pkgver() {
  npm view signalk-server dist-tags.latest
}

prepare() {
  cd "$srcdir"
  rm -rf signalk-server
  mv package signalk-server

  rm -rf plugins
  mkdir -p plugins/node_modules
}

build() {
  cd "$srcdir/signalk-server"
  npm install --cache "npm-cache"
  rm -rf "npm-cache"
}

package() {
  cd "$srcdir"

  # Create dedicated user
  install -Dm644 "$startdir/signalk-server.sysusers" "$pkgdir/usr/lib/sysusers.d/signalk-server.conf"

  mkdir -p "$pkgdir/usr/lib/signalk-server"
  cp -r "signalk-server/." "$pkgdir/usr/lib/signalk-server"

  cp -r "plugins" "$pkgdir/usr/lib/signalk-server/plugins"

  mkdir -p "$pkgdir/etc/signalk-server"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/usr/bin"

  cp "signalk-server.service" "$pkgdir/usr/lib/systemd/system/signalk-server.service"
  cp "signalk-server.socket" "$pkgdir/usr/lib/systemd/system/signalk-server.socket"
  cp "defaults.json" "$pkgdir/etc/signalk-server/defaults.json"
  cp "defaults.json" "$pkgdir/etc/signalk-server/settings.json"
  cp "package.json" "$pkgdir/etc/signalk-server/package.json"

  ln -s '/usr/lib/signalk-server/bin/signalk-server' "$pkgdir/usr/bin/signalk-server"
  ln -s '/usr/lib/signalk-server/plugins/node_modules' "$pkgdir/etc/signalk-server/node_modules"
  ln -s '/etc/signalk-server/package.json' "$pkgdir/usr/lib/signalk-server/plugins/package.json"

  mkdir -p "$pkgdir/var/lib/signalk-server"

  find "$pkgdir" -name package.json -type f -print0 | xargs -r -0 sed -i /_where/d
}


