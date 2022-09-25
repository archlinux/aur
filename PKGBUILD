# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pv-git
pkgver=1.6.20.r6.ga9cef81
pkgrel=1
pkgdesc="Pipe Viewer is a terminal-based tool for monitoring the progress of data through a pipeline"
arch=('i686' 'x86_64')
url="https://www.ivarch.com/programs/pv.shtml"
license=('custom:Artistic 2.0')
depends=('glibc')
makedepends=('git')
provides=("pv=$pkgver")
conflicts=('pv')
source=("git+https://github.com/a-j-wood/pv.git")
sha256sums=('SKIP')


pkgver() {
  cd "pv"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "pv"

  ./generate.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "pv"

  make check
}

package() {
  cd "pv"

  make DESTDIR="$pkgdir" install
  install -Dm644 "doc/COPYING" -t "$pkgdir/usr/share/licenses/pv"
}
