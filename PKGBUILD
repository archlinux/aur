# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=icu-git
pkgver=r33353.ge8dfea9bb6
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://site.icu-project.org/"
license=('custom:icu')
depends=('glibc' 'sh')
makedepends=('git' 'git-lfs')
provides=('icu' libicu{data,i18n,io,test,tu,uc}.so)
conflicts=('icu')
_source=("https://github.com/unicode-org/icu.git")


prepare() {
  # workaround for `makepkg` failing `git clone` with git-lfs
  git clone "$_source"
}

pkgver() {
  cd "icu"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "icu/icu4c/source"

  export CC=gcc CXX=g++
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc"
  make
}

check() {
  cd "icu/icu4c/source"

  make check
}

package() {
  cd "icu/icu4c/source"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/icu/icu4c/LICENSE" -t "$pkgdir/usr/share/licenses/icu"
}
