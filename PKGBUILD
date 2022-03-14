# Maintainer: Gomasy <nyan@gomasy.jp>

_pkgname=rbfeeder
pkgname=$_pkgname-git
_pkgver=1.0.7
pkgver=$_pkgver.g3d9e533
pkgrel=1
pkgdesc="Software for uploading ADS-B data to RadarBox24.com"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.radarbox.com/sharing-data"
license=('GPL2')
depends=('dump1090')
makedepends=('git' 'pkgconf' 'protobuf-c' 'jansson')
source=(
        'git://github.com/airnavsystems/rbfeeder.git'
        'rbfeeder.service'
        'rbfeeder.sysusers')
sha256sums=(
            'SKIP'
            '558de4eef958a99b8f0f30e86ef1841060f14e1887b8cfd9a81d68c19b7ffdc7'
            '3fb1dae902740e84254a2548c5d81fff18b18658ed408576a438968e43e51746')
backup=('etc/rbfeeder.ini')
install=rbfeeder.install

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $_pkgver.g$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  make proto
  make rbfeeder
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 -t "$pkgdir/usr/bin" rbfeeder
  install -Dm644 -t "$pkgdir/etc" etc/rbfeeder.ini

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" rbfeeder.service
  install -Dm644 rbfeeder.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
