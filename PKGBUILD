# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Duncan Townsend <duncant@mit.edu>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>

pkgname=electrum-server-git
pkgver=20150919
pkgrel=1
pkgdesc="Server to support Electrum python-based Bitcoin client"
arch=('i686' 'x86_64')
depends=('leveldb'
         'openssl'
         'python2'
         'python2-irc'
         'python2-jsonrpclib'
         'python2-plyvel'
         'python2-pyopenssl'
         'snappy')
makedepends=('git' 'python2-setuptools')
optdepends=('bitcoin-core: Bitcoin core headless P2P node'
            'electrum: Bitcoin thin client')
url="https://github.com/spesmilo/electrum-server"
license=('AGPL3')
source=(git+https://github.com/spesmilo/electrum-server
        electrum-server.service)
sha256sums=('SKIP'
            'd90503ea4b71c52dfcb68d7cfb6f7ea313380a7d8972e8510d7bbb7494d6f1b4')
backup=('etc/electrum-server.banner'
        'etc/electrum-server.conf')
provides=('electrum-server')
conflicts=('electrum-server')
install=electrum-server.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'

  msg 'Changing electrum.banner to electrum-server.banner...'
  find . -type f -print0 | xargs -0 sed -i 's#/etc/electrum\.banner#/etc/electrum-server.banner#g'

  msg 'Changing electrum.conf to electrum-server.conf...'
  cp -dpr --no-preserve=ownership electrum.conf.sample electrum-server.conf.sample
  find . -type f -print0 | xargs -0 sed -i 's#electrum\.conf#electrum-server.conf#g'

  msg 'Changing electrum.log to electrum-server.log...'
  find . -type f -print0 | xargs -0 sed -i 's#electrum\.log#electrum-server/electrum-server.log#g'
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/electrum-server/LICENSE"

  msg 'Installing documentation...'
  for _doc in HOWTO.md INSTALL README-IRC.md README.md; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/electrum-server/$_doc"
  done

  msg 'Installing'
  install -dm 700 "$pkgdir/usr/share/electrum-server"
  install -dm 700 "$pkgdir/var/log/electrum-server"
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Installing electrum-server.conf...'
  install -Dm 600 electrum-server.conf.sample "$pkgdir/etc/electrum-server.conf"

  msg 'Installing electrum-server.banner...'
  touch "$pkgdir/etc/electrum-server.banner"

  msg 'Installing electrum-server.service...'
  install -Dm 644 "$srcdir/electrum-server.service" "$pkgdir/usr/lib/systemd/system/electrum-server.service"

  msg 'Fixing binaries...'
  rm -f "$pkgdir/usr/bin/electrum-server"
  mv "$pkgdir/usr/bin/run_electrum_server.py" "$pkgdir/usr/bin/electrum-server"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
