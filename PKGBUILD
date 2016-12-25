# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=centrifugo
pkgver=1.6.1
pkgrel=1
pkgdesc='Real-time messaging server for web applications'
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
_vendor="github.com/centrifugal"
url=https://$_vendor/$pkgname
license=('MIT')
depends=('systemd')
makedepends=('go' 'git')
install=$pkgname.install
backup=(etc/$pkgname/config.json)
source=(git+$url.git#tag=v$pkgver
        $pkgname.service
        $pkgname.sysusers)
sha256sums=('SKIP'
            'd1840e7ef5a3b31cad41f498ce02d33d5d88c70f408f9783511387b496ab99e1'
            '0e8c55453bb4c6ea868f4b095237523da85b478fbfda7f1518299cba5356c09f')

prepare() {
  mkdir -p $_vendor
  mv $pkgname $_vendor
}

build() {
  cd $_vendor/$pkgname
  GOPATH=$srcdir/.. go build
}

package() {
  install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
  install -Dm644 $srcdir/$pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf

  cd $_vendor/$pkgname
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 config.json $pkgdir/etc/centrifugo/config.json
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  mkdir -p $pkgdir/etc/default
  touch $pkgdir/etc/default/centrifugo
}
