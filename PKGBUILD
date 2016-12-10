# Maintainer: Nicola Fontana <ntd@entidi.it>

pkgname=pforth-git
pkgver=20160529
pkgrel=1
pkgdesc='A portable implementation of the Forth programming language written in ANSI C'
arch=(any)
url='http://www.softsynth.com/pforth/'
license=(custom)
depends=()
makedepends=('git')
conflicts=('pforth')
provides=('pforth')
source=()
source=('git+https://github.com/philburk/pforth.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pforth"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  local cflags='-DPF_DEFAULT_DICTIONARY=\"/usr/share/pforth/pforth.dic\"'

  # --std=c89 implicitely declares off_t I/O functions such as ftello
  cflags="$cflags --std=c89"

  # -D_BSD_SOURCE=1 is defined to avoid the ‘ECHOCTL’ undeclared error
  cflags="$cflags -D_BSD_SOURCE=1"

  cd "$srcdir/pforth"
  make -j 1 -f build/unix/Makefile all \
    SRCDIR=. FULL_WARNINGS= DEBUGOPTS= EXTRA_CCOPTS="$cflags"
}

package() {
  local prefix="$pkgdir/usr"

  cd "$srcdir/pforth"

  install -Dm755 pforth "$prefix/bin/pforth"
  install -Dm755 pforth_standalone "$prefix/bin/pforth_standalone"
  install -Dm644 pforth.dic "$prefix/share/pforth/pforth.dic"
  install -Dm644 readme.txt "$prefix/share/pforth/README"
  install -Dm644 releases.txt "$prefix/share/pforth/NEWS"
}

# vim:set ts=2 sw=2 et:
