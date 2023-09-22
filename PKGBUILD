# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache
pkgver=0.28.7
pkgrel=2
pkgdesc="An advanced compiler accelerator"
arch=('i686' 'x86_64')
url="https://gitlab.com/bits-n-bites/buildcache"
license=('zlib')
depends=('gcc-libs' 'openssl')
makedepends=('cmake')
optdepends=('lua')
source=("$pkgname-$pkgver.tar.bz2::https://gitlab.com/bits-n-bites/buildcache/-/archive/v$pkgver/buildcache-v$pkgver.tar.bz2"
        "fix_build.patch::https://gitlab.com/bits-n-bites/buildcache/-/merge_requests/303.patch")
sha256sums=('ec9680311c0e6cf41fa0fc124b22334396cd5b6e300f55773136546a6c333b73'
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
