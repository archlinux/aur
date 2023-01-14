# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=winchecksec-git
pkgver=3.1.0.r5.gf8f6727
pkgrel=1
pkgdesc="Checksec, but for Windows: static detection of security mitigations in executables"
arch=('i686' 'x86_64')
url="https://trailofbits.github.io/winchecksec/"
license=('apache')
depends=('gcc-libs' 'openssl' 'pe-parse')
makedepends=('git' 'cmake' 'uthenticode')
provides=("winchecksec=$pkgver")
conflicts=('winchecksec')
source=("git+https://github.com/trailofbits/winchecksec.git")
sha256sums=('SKIP')


pkgver() {
  cd "winchecksec"

  _tag=$(git tag -l --sort -v:refname | grep -E 'v?[\d\.]+' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "winchecksec"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  make -C "_build"
}

package() {
  cd "winchecksec"

  install -Dm755 "_build/winchecksec" -t "$pkgdir/usr/bin"
}
