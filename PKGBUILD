# Maintainer: East Arctica <eastarctica@gmail.com>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=mosquitto-git
_pkgname=mosquitto
pkgver=r4725.b3b4d77e
pkgrel=2
pkgdesc="An open source MQTT broker"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://mosquitto.org/"
depends=('openssl' 'cjson' 'libmicrohttpd')
makedepends=('git' 'python' 'docbook-xsl')
conflicts=('mosquitto')
provides=('mosquitto')
replaces=('mosquitto-hg')
license=('EPL')
install=$pkgname.install
source=("$_pkgname::git+https://github.com/eclipse-mosquitto/mosquitto.git"
        'mosquitto.service')
md5sums=('SKIP'
         'bac7f1ff5c13b9e04e82c875c5f2c422')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make prefix=/usr DESTDIR="$pkgdir/" install

  # usr move
  cp "$pkgdir/usr/sbin/mosquitto" "$pkgdir/usr/bin/"
  rm -r "$pkgdir/usr/sbin/"

  # systemd service file
  install -Dm644 "$srcdir/mosquitto/service/systemd/mosquitto.service.simple" "$pkgdir/usr/lib/systemd/system/mosquitto.service"
  mv "$pkgdir/etc/mosquitto/mosquitto.conf.example" "$pkgdir/etc/mosquitto/mosquitto.conf"
}

# vim:set ts=2 sw=2 et:
