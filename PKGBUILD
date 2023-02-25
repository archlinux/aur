# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ssdfs-tools-git
pkgver=4.09.r15.gba47e91
pkgrel=1
pkgdesc="SSDFS file system utilities"
arch=('i686' 'x86_64')
url="https://github.com/dubeyko/ssdfs-tools"
license=('BSD')
depends=('libblkid.so' 'libuuid.so' 'zlib')
makedepends=('git' 'linux-api-headers' 'util-linux')
provides=("ssdfs-tools=$pkgver")
conflicts=('ssdfs-tools')
source=("git+https://github.com/dubeyko/ssdfs-tools.git")
sha256sums=('SKIP')


pkgver() {
  cd "ssdfs-tools"

  _tag=$(git tag -l --sort -v:refname | grep -P '^v?[\d\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ssdfs-tools"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin"
  make
}

check() {
  cd "ssdfs-tools"

  make check
}

package() {
  cd "ssdfs-tools"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/ssdfs-tools"
}
