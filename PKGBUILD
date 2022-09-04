# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pcre2-git
pkgver=10.40.r45.gdb53e40
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions"
arch=('i686' 'x86_64')
url="https://www.pcre.org/"
license=('BSD' 'custom')
depends=('glibc' 'bzip2' 'readline' 'zlib')
makedepends=('git')
provides=("pcre2=$pkgver")
conflicts=('pcre2')
options=('staticlibs')
source=("git+https://github.com/PCRE2Project/pcre2.git")
sha256sums=('SKIP')


pkgver() {
  cd "pcre2"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^pcre2-//'
}

build() {
  cd "pcre2"

  ./autogen.sh
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

  make check
}

package() {
  cd "pcre2"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENCE" -t "$pkgdir/usr/share/licenses/pcre2"
}
