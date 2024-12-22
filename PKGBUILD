# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

_pkgname=byedpi
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url=https://github.com/hufrea/$_pkgname
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
backup=(etc/$_pkgname.conf)
options=(!debug)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed -r 's/^[r|v]//;s/-/+/g' ||
    printf '%s+%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
  )
}

prepare() {
  cd $_pkgname
  sed -i 's|ExecStart=ciadpi|ExecStart=/usr/bin/ciadpi|' \
    dist/linux/$_pkgname.service
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  install -Dm644 -t $pkgdir/etc dist/linux/$_pkgname.conf
  install -Dm755 -t $pkgdir/usr/bin ciadpi
  install -Dm644 -t $pkgdir/usr/lib/systemd/system dist/linux/$_pkgname.service
  install -Dm644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE
}
