# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=mosquitto-hg
_hgname=mosquitto
pkgver=3070.db5147ce80f1
pkgrel=2
pkgdesc="An Open Source MQTT v3.1 Broker"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://mosquitto.org/"
depends=('openssl')
makedepends=('mercurial' 'python' 'docbook-xsl')
conflicts=('mosquitto')
provides=('mosquitto')
license=('BSD')
install=$pkgname.install
source=("$_hgname::hg+https://bitbucket.org/oojah/mosquitto#branch=1.2"
        'mosquitto.service'
        'docbook.patch'
        'usr_move.patch')
md5sums=('SKIP'
         'bac7f1ff5c13b9e04e82c875c5f2c422'
         '8e1c14e99d7eba210b874e80b5153f0d'
         'b37551bbdccf751cdc5ea5b25afd2f5a')

pkgver() {
  cd "$srcdir/$_hgname"

  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/$_hgname"

  patch -p1 < ../docbook.patch
  patch -p1 < ../usr_move.patch

  make
}

package() {
  cd "$srcdir/$_hgname"

  make prefix=/usr DESTDIR="$pkgdir/" install

  # systemd service file
  install -Dm644 "$srcdir/mosquitto.service" "$pkgdir/usr/lib/systemd/system/mosquitto.service"
  echo 'pid_file /run/mosquitto.pid' >> "$pkgdir/etc/mosquitto/mosquitto.conf"

  # license files
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE-3rd-party.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-3rd-party"
}

# vim:set ts=2 sw=2 et:
