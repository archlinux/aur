# Maintainer: Jaël Champagne Gareau <gareau_jael@hotmail.com>
# Contributor: John W. Trengrove <john@retrofilter.com>
_pkgname=libtap
pkgname=$_pkgname-git
pkgver=0.1.0+44+gb53e4ef
pkgrel=1
pkgdesc="C testing library implementing the Test Anything Protocol"
arch=('x86_64')
url="https://github.com/zorgnax/$_pkgname"
license=('LGPL-3.0-only')
depends=('glibc')
makedepends=('git')
options=("!debug")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed -r 's/^[r|v]//;s/-/+/g' ||
    printf '%s+%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
  )
}

build() {
  cd ${_pkgname}
  make
}

package() {
  cd ${_pkgname}

  # Install shared library (.so)
  install -Dm755 libtap.so "$pkgdir/usr/lib/libtap.so"

  # Install static library (.a) (remove if not needed)
  install -Dm644 libtap.a "$pkgdir/usr/lib/libtap.a"

  # Install pkg-config file (.pc)
  install -Dm644 tap.pc "$pkgdir/usr/lib/pkgconfig/tap.pc"

  # Install headers
  install -Dm644 tap.h "$pkgdir/usr/include/tap.h"
}
