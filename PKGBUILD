# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=exfatprogs-git
pkgver=1.1.3.r59.gb8a9b32
pkgrel=1
pkgdesc="exFAT filesystem userspace utilities"
arch=('i686' 'x86_64')
url="https://github.com/exfatprogs/exfatprogs"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=("exfatprogs=$pkgver" 'exfat-utils')
conflicts=('exfatprogs' 'exfat-utils')
source=("git+https://github.com/exfatprogs/exfatprogs.git#branch=exfat-next")
sha256sums=('SKIP')


pkgver() {
  cd "exfatprogs"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "exfatprogs"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin"
  make
}

check() {
  cd "exfatprogs"

  make check
}

package() {
  cd "exfatprogs"

  make DESTDIR="$pkgdir" install
}
