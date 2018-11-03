# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=aspell-git
pkgver=0.60.7.rc1.r3.gb2e2b25
pkgrel=1
pkgdesc="Free and Open Source spell checker"
arch=('i686' 'x86_64')
url="http://aspell.net/"
license=('LGPL')
depends=('ncurses')
makedepends=('git')
optdepends=('perl: to import old dictionaries')
provides=('aspell')
conflicts=('aspell')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/aspell.git")
sha256sums=('SKIP')


pkgver() {
  cd "aspell"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/rel-//p}')
  _rev=$(git rev-list --count rel-$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/-/./g'
}

build() {
  cd "aspell"

  PERL_USE_UNSAFE_INC=1 ./autogen
  ./configure \
    --prefix="/usr" --sysconfdir="/etc" \
    --enable-static
  make
}

package() {
  cd "aspell"

  make DESTDIR="$pkgdir" install
}
