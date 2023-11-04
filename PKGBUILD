# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sleuthkit-git
pkgver=4.12.1.r33.g07e100662
pkgrel=1
pkgdesc="A library and collection of command line digital forensics tools"
arch=('i686' 'x86_64')
url="https://www.sleuthkit.org/sleuthkit/"
license=('custom')
depends=('gcc-libs' 'libewf' 'sqlite')
makedepends=('git')
optdepends=('perl')
provides=("sleuthkit=$pkgver")
conflicts=('sleuthkit')
options=('staticlibs')
source=("git+https://github.com/sleuthkit/sleuthkit.git")
sha256sums=('SKIP')


pkgver() {
  cd "sleuthkit"

  _tag=$(git tag -l --sort -v:refname | grep -E '^sleuthkit-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^sleuthkit-//'
}

build() {
  cd "sleuthkit"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "sleuthkit"

  #make check
}

package() {
  cd "sleuthkit"

  make DESTDIR="$pkgdir" install
  install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/sleuthkit"
}
