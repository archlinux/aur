# Maintainer: archdub <groknok [at] gmail [dot] com>
# Contributor: Invarianz <invarianztheorem [at] web [dot] de>
# Contributor: cmichi <mich [at] elmueller [dot] net>

# This package provides nvi (new vi) with multibyte support

pkgname=nvi-multibyte-git
pkgdesc="nvi with multibyte support"
arch=('x86_64')
url="git://repo.or.cz/nvi.git"
license=("BSD-3-Clause")
depends=(
  sh
  glibc
  ncurses
)
makedepends=(
  chrpath
  git
)
conflicts=('nvi' 'nvi-multibyte-upstream') # previous name of this package was "nvi-multibyte-upstream"
provides=('nvi')
source=("git+https://repo.or.cz/nvi.git")
sha512sums=('SKIP')
pkgver=1.81.6_20260124
pkgrel=2

pkgver() {
  # The last release was 1.81.6, but there have been commits since then.
  # Append timestamp (yyyymmdd) of latest commit.
  cd nvi
  printf "$(git describe --tags --abbrev=0  | sed 's/^nvi.//;s/\([^-]*-g\)/r\1/;s/-/./g')_$(git log -1 --format='%cd' --date=short | tr -d -- '-')"
}

build(){
  cd nvi/dist
  ./distrib
  cd ../build.unix
  env CPPFLAGS="$CFLAGS -fpermissive  " \
    ../dist/configure \
    --prefix="$pkgdir"/usr \
    --program-prefix=n \
    --enable-widechar # for multibyte support
  make
  # Remove rpath which points to a folder in the package builder computer pc, which is a security risk.
  # The path seems to be superfluous, hence why it can be removed. As an (untested) alternative it
  # could be replaced with /usr/lib.
  # chrpath is being used for this tweak as it is small. If it ever ceases to exist an alternative tool would
  # be patchelf.
  chrpath -d .libs/vi
}

package(){
  cd nvi/build.unix
  make install
  install -Dm644 "$srcdir"/nvi/LICENSE \
          "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
