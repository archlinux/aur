# Maintainer: Ben 'silentnoodle' Lönnqvist <silentnoodle at cock dot li>
pkgname=planarally-bin
pkgver=2022.2.2
pkgrel=1
pkgdesc='A companion tool for when you travel into the planes.'
arch=('x86_64')
url='https://www.planarally.io'
license=('MIT')

depends=(
  'nodejs'
  'python'
  'python-aiohttp-jinja2'
  'python-aiohttp-security'
  'python-aiohttp-session'
  'python-jinja'
  'python-cryptography'
  'python-bcrypt'
  'python-socketio'
  'python-peewee'
  'python-typing_extensions'
)
makedepends=('npm')

makedepends=()
source=("https://github.com/Kruptein/PlanarAlly/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz" planarally.service planarally.sysusers planarally.tmpfiles)

sha256sums=('a0995afcd8a07ddf3fc88efff42162470d0c288595e63566eb064502eb5bbc3d'
            'f3b1af046393e61b4fd56f80a7e6cc7f468681df798da1539da8db1560d7eb90'
            '1e3912e31bf07de8311b6558562929b6aa8fad514e9b7c3addce495886813d2d'
            '2e06a0ed7b220a1ffedc5d836bfba824785180841a7b121def0a52cf91f0d535')

prepare() {
  cd "$srcdir/server"
  sed -i '1s;^;#!/usr/bin/env python3\n;' planarserver.py
}

package() {
  install -dm655 "$pkgdir/usr/bin"
  install -dm655 "$pkgdir/opt/planarally"
  install -Dm 644 planarally.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm 644 planarally.sysusers "$pkgdir/usr/lib/sysusers.d/planarally.conf"
  install -Dm 644 planarally.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/planarally.conf"
  cp -dr --no-preserve='ownership' server "$pkgdir/opt/planarally/"
  chown -R planarally:planarally "$pkgdir/opt/planarally"
  ln -s "/opt/planarally/server/planarserver.py" "$pkgdir/usr/bin/planarally"
}

