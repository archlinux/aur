# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=s6-git
pkgver=2.11.1.2.r0.gcb45493
pkgrel=1
pkgdesc="A small suite of programs for UNIX, designed to allow process supervision"
arch=('i686' 'x86_64')
url="https://skarnet.org/software/s6/"
license=('ISC')
depends=('glibc' 'execline' 'skalibs')
makedepends=('git')
provides=("s6=$pkgver")
conflicts=('s6')
options=('staticlibs')
source=("git+https://github.com/skarnet/s6.git")
sha256sums=('SKIP')


pkgver() {
  cd "s6"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "s6"

  ./configure \
    --prefix="/usr" \
    --libexecdir="/usr/lib/s6" \
    --enable-shared
  make
}

package() {
  cd "s6"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/s6"
}
