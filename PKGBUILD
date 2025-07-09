# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gmssl-git
pkgver=3.1.1.r311.g34fa519d
pkgrel=1
pkgdesc="Chinese national cryptographic algorithms and protocols"
arch=('i686' 'x86_64')
url="http://gmssl.org/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("gmssl=$pkgver")
conflicts=('gmssl')
source=("git+https://github.com/guanzhi/GmSSL.git")
sha256sums=('SKIP')


pkgver() {
  cd "GmSSL"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "GmSSL"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "GmSSL"

  #cmake --build "_build" --target test
}

package() {
  cd "GmSSL"

  DESTDIR="$pkgdir" cmake --install "_build"
}
