# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=catatonit-git
pkgver=0.1.7.r4.gd8d72fe
pkgrel=2
pkgdesc="A container init that is so simple it's effectively brain-dead"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/catatonit/"
license=('GPL')
makedepends=('git')
provides=("catatonit=$pkgver")
conflicts=('catatonit')
options=('staticlibs')
source=("git+https://github.com/openSUSE/catatonit.git")
sha256sums=('SKIP')


pkgver() {
  cd "catatonit"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "catatonit"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "catatonit"

  #make check
}

package() {
  cd "catatonit"

  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/lib/podman"
  ln -s "/usr/bin/catatonit" "$pkgdir/usr/lib/podman"
}
