# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache
pkgver=0.28.9
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('i686' 'x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('Zlib')
depends=('gcc-libs' 'openssl')
makedepends=('cmake')
optdepends=('lua')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bits-n-bites/buildcache/-/archive/v$pkgver/buildcache-v$pkgver.tar.gz"
        "fix_build.patch::https://gitlab.com/bits-n-bites/buildcache/-/merge_requests/303.patch")
sha256sums=('df303d25585ae02bd60710784ccc6ed138591a51793d27bdf38e6853e1dd7738'
            '7fa602959174e3c9a51394d335363741a6e1ad09aeef7d706aeece5293ebd6f1')


prepare() {
  cd "$pkgname-v$pkgver"

  patch -Np1 -i "$srcdir/fix_build.patch"
}

build() {
  cd "$pkgname-v$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    "src"
  make -C "_build"
}

check() {
  cd "$pkgname-v$pkgver"

  make -C "_build" test
}

package() {
  cd "$pkgname-v$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
