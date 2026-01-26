# Maintainer: archdub <groknok [at] gmail [dot] com>
# Contributor: Invarianz <invarianztheorem [at] web [dot] de>
# Contributor: cmichi <mich [at] elmueller [dot] net>

# This package provides the latest snapshot of nvi with multibyte support enabled.
# This package used to be called "nvi-multibyte-upstream".

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
)
conflicts=('nvi' 'nvi-multibyte-upstream')
provides=('nvi')

_COMMIT="401bfbf750bb2da400dec870f62cc59c78b8e0fa"
source=("http://repo.or.cz/nvi.git/snapshot/$_COMMIT.tar.gz")
sha512sums=('d1fffb784d164eaa862326c0e1b0a7e2360350c631ece62bc9ec33e7928c47474ca7329e162556f4b32eb631e08dac09426df65280c45026ac0dac558e544f6b')

# The last official release was 1.81.6, but there have been commits since then.
# Append timestamp (yyyymmdd) of latest commit.
pkgver=1.81.6_20260124
pkgrel=1
_COMMIT_HASH="${_COMMIT:0:7}"

build(){
  cd "$srcdir"/nvi-$_COMMIT_HASH/dist/
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
  cd "$srcdir"/nvi-$_COMMIT_HASH/build.unix
  make install
  install -Dm644 "$srcdir"/nvi-$_COMMIT_HASH/LICENSE \
          "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
