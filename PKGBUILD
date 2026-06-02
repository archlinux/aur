# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=avm-git
pkgver=1.0.0.r5.g638905e970
pkgrel=1
pkgdesc="AVM (AOM Video Model) is the reference software for AV2 codec from Alliance for Open Media"
arch=('i686' 'x86_64')
url="https://github.com/AOMediaCodec/avm"
license=('BSD-3-Clause' 'LicenseRef-avm')
depends=('glibc' 'libgcc' 'libstdc++' 'nasm')
makedepends=('git' 'cmake')
provides=("avm=$pkgver")
conflicts=('avm' 'aom')
options=('staticlibs')
source=("git+https://github.com/AOMediaCodec/avm.git")
sha256sums=('SKIP')


pkgver() {
  cd "avm"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "avm"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_POLICY_VERSION_MINIMUM="3.5" \
    ./
  cmake --build "_build"
}

check() {
  cd "avm"

  #cmake --build "_build" --target test
}

package() {
  cd "avm"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 {LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/avm"
}
