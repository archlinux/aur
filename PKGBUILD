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
depends=('dump1090' 'protobuf-c' 'jansson')
makedepends=('git' 'pkgconf')
source=(
        'git://github.com/airnavsystems/rbfeeder.git'
        'rbfeeder.service'
        'rbfeeder.sysusers'
        'rbfeeder.tmpfiles'
        'rbfeeder.patch')
sha256sums=(
            'SKIP'
            '558de4eef958a99b8f0f30e86ef1841060f14e1887b8cfd9a81d68c19b7ffdc7'
            '3fb1dae902740e84254a2548c5d81fff18b18658ed408576a438968e43e51746'
            'd8d127259681d44b8d731c80c14658be5fcac44cf5329601dd6d89b1a4d7e82a'
            '42485ccb04cd0b3cc6be8620a34d4281488166c73d341bdb1f1d1d16b3a61334')
backup=('etc/rbfeeder.ini')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $_pkgver.g$(git rev-parse --short HEAD)
}

prepare() {
    patch -p1 -d "$srcdir/$_pkgname" < rbfeeder.patch
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

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../../rbfeeder.service
  install -Dm644 ../../rbfeeder.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 ../../rbfeeder.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
