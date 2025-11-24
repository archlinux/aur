# Maintainer: Lobo Torres <lobo@quiltro.org>
# Contributor: Nicola Fontana <ntd@entidi.it>

pkgname=pforth-git
pkgver=20250920
pkgrel=1
pkgdesc='A portable implementation of the Forth programming language written in ANSI C'
arch=(any)
url='http://www.softsynth.com/pforth/'
license=(custom)
depends=('glibc')
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
  local extra_cflags="-DPF_DEFAULT_DICTIONARY=\\\"/usr/share/pforth/pforth.dic\\\""
  extra_cflags="$extra_cflags --std=c89 -D_BSD_SOURCE=1"

  cd "$srcdir/pforth"
  make -j1 -f platforms/unix/Makefile all \
    SRCDIR=. CFLAGS:="\$(WIDTHOPT) -x c $CFLAGS $extra_cflags"
}

package() {
  local prefix="$pkgdir/usr"
  cd "$srcdir/pforth"

  install -Dm755 pforth "$prefix/bin/pforth"
  install -Dm755 pforth_standalone "$prefix/bin/pforth_standalone"
  install -Dm644 pforth.dic "$prefix/share/pforth/pforth.dic"
  install -Dm644 README.md "$prefix/share/pforth/README"
  install -Dm644 RELEASES.md "$prefix/share/pforth/NEWS"
}

# vim:set ts=2 sw=2 et:
