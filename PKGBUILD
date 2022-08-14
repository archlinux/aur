# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gss-git
pkgver=1.0.4.r1.gb20ac80
pkgrel=1
pkgdesc="GNU Generic Security Service"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gss/"
license=('GPL')
depends=('glibc')
makedepends=('git' 'gengetopt' 'help2man')
provides=("gss=$pkgver")
conflicts=('gss')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/gss.git")
sha256sums=('SKIP')


prepare() {
  cd "gss"

  git submodule update --init --recursive
}

pkgver() {
  cd "gss"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "gss"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc"
  make
}

check() {
  cd "gss"

  make check
}

package() {
  cd "gss"

  make DESTDIR="$pkgdir" install
}
