# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=dragonflydb
pkgver=0.16.0
pkgrel=1
pkgdesc='A modern replacement for Redis/Memcached'
arch=('x86_64')
url='https://dragonflydb.io'
license=('custom:BSL1.1')
depends=('openssl' 'boost-libs' 'libunwind')
makedepends=('git' 'cmake' 'ninja' 'python' 'boost')
options=('!buildflags')
_commit='41e359277f4c1d5a70a028179596e8ed8ceaa5db'
source=(
  "$pkgname::git+https://github.com/dragonflydb/dragonfly#commit=$_commit"
  'github.com-romage-helio::git+https://github.com/romange/helio'
)
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

# TODO unbundle gperf, mimalloc, xxhash, uring.
prepare() {
  cd "$pkgname"

  # prepare git submodule(s)
  git submodule init
  git config submodule.helio.url "$srcdir/github.com-romage-helio"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  ./helio/blaze.sh -release

  cd build-opt

  ninja dragonfly
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build-opt/dragonfly

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
