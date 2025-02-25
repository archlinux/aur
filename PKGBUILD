# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=which-git
pkgver=r251.g3e2c8f8
pkgrel=1
pkgdesc="A utility to show the full path of commands"
arch=('i686' 'x86_64')
url="https://savannah.gnu.org/projects/which"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("which=$pkgver")
conflicts=('which')
source=("git+https://git.savannah.gnu.org/git/which.git")
sha256sums=('SKIP')


prepare() {
  cd "which"

  git submodule update --init --recursive
}

pkgver() {
  cd "which"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "which"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-maintainer-mode
  make
}

check() {
  cd "which"

  #make check
}

package() {
  cd "which"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/which"
}
