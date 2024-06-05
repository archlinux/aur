# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tunsafe-git
pkgver=1.4.r79.g85a871c
pkgrel=2
pkgdesc="High performance and secure VPN client that uses the WireGuard protocol"
arch=('i686' 'x86_64')
url="https://tunsafe.com/"
license=('AGPL-1.0' 'BSD-3-Clause' 'OpenSSL')
depends=('gcc-libs')
makedepends=('git')
provides=("tunsafe=$pkgver")
conflicts=('tunsafe')
source=("git+https://github.com/TunSafe/TunSafe.git")
sha256sums=('SKIP')


prepare() {
  cd "TunSafe"

  sed -i "s/clang++-6.0/g++ $CXXFLAGS/;s/-lrt/-lrt $LDFLAGS/" "build_linux.sh"
}

pkgver() {
  cd "TunSafe"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "TunSafe"

  ./build_linux.sh
}

package() {
  cd "TunSafe"

  install -Dm755 "tunsafe" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.AGPL.TXT" -t "$pkgdir/usr/share/licenses/tunsafe"
}
