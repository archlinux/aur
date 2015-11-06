# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=syncthing-relaysrv
pkgver=0.12.1
pkgrel=1
pkgdesc='Relay server for Syncthing'
url='https://github.com/syncthing/relaysrv/'
license=('MIT')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git' 'go' 'godep' 'inetutils' 'sed')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        syncthing-relaysrv.tmpfiles
        syncthing-relaysrv.sysusers)
install=$pkgname.install
md5sums=('8a5af0bca0037e3a3ffe050bda680286'
         'b94da81c43dbee67bcf3e9b80de7a1d6'
         'a63ec0b544d22d9dfab4c0cc8d40aa60')

prepare() {
  cd relaysrv-$pkgver
  sed -i 's|/usr/bin/relaysrv|/usr/bin/syncthing-relaysrv|' \
    etc/linux-systemd/$pkgname.service
}

build() {
  cd relaysrv-$pkgver

  export GOPATH="$(pwd)/Godeps/_workspace:$srcdir"
  go build -i -v -ldflags -w
}

package() {
  cd relaysrv-$pkgver
  install -Dm755 relaysrv-$pkgver "$pkgdir/usr/bin/syncthing-relaysrv"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 etc/linux-systemd/$pkgname.service \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm0644 "$srcdir/$pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm0644 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

}
