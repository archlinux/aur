# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pcre2-git
pkgver=10.44.r219.gd50aa583
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions"
arch=('i686' 'x86_64')
url="https://www.pcre.org/"
license=('BSD-3-Clause')
depends=('glibc' 'bzip2' 'readline' 'zlib')
makedepends=('git')
provides=("pcre2=$pkgver" libpcre2-{8,16,32,posix}.so)
conflicts=('pcre2')
options=('staticlibs')
source=("git+https://github.com/PCRE2Project/pcre2.git")
sha256sums=('SKIP')


prepare() {
  cd "pcre2"

  git submodule update --init --recursive
}

pkgver() {
  cd "pcre2"

  _tag=$(git tag -l --sort -v:refname | grep -E '^pcre2-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^pcre2-//'
}

build() {
  cd "pcre2"

  ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --enable-jit \
    --enable-pcre2-16 \
    --enable-pcre2-32 \
    --enable-pcre2grep-libbz2 \
    --enable-pcre2grep-libz \
    --enable-pcre2test-libreadline
  make
}

check() {
  cd "pcre2"

  #make check
}

package() {
  cd "pcre2"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENCE.md" -t "$pkgdir/usr/share/licenses/pcre2"
}
