# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=icu-git
pkgver=78.2.r81.g4ebbe0c8280
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="https://icu.unicode.org/"
license=('LicenseRef-icu')
depends=('gcc-libs' 'glibc' 'sh')
makedepends=('git')
provides=("icu=$pkgver" libicu{data,i18n,io,test,tu,uc}.so)
conflicts=('icu')
source=("git+https://github.com/unicode-org/icu.git")
sha256sums=('SKIP')


pkgver() {
  cd "icu"

  _tag=$(git tag -l --sort -v:refname | grep -E '^release-[0-9.-]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^release-//;s/-/./g'
}

build() {
  cd "icu/icu4c/source"

  export \
    CC=gcc \
    CXX=g++
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc"
  make
}

check() {
  cd "icu/icu4c/source"

  #make check
}

package() {
  cd "icu/icu4c/source"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/icu/icu4c/LICENSE" -t "$pkgdir/usr/share/licenses/icu"
}
