# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=dragonflydb
pkgver=1.1.2
pkgrel=1
pkgdesc='A modern replacement for Redis/Memcached'
arch=('x86_64')
url='https://dragonflydb.io'
license=('custom:BSL1.1')
depends=('openssl' 'boost-libs' 'libunwind')
makedepends=('git' 'cmake' 'ninja' 'python' 'boost')
options=('!buildflags')
_commit='6d269096df37e9f4389d4d2b354113a0c8cbfb74'
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
