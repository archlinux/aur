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

_COMMIT="957906b0e3bcc0f795cf8c6b7313fcc4ec338784"
source=("http://repo.or.cz/nvi.git/snapshot/$_COMMIT.tar.gz")
sha512sums=('f49ffca6a58669f08ebd11bc141509f190389f74cb1670f30550a40b4d5b7350e144e72daf425682b4d032bcb95a3ec78ce595a9a533eaabda5e5c8d5a780565')

# The last official release was 1.81.6, but there have been commits since then.
# Append timestamp (yyyymmdd) of latest commit.
pkgver=1.81.6_20241228
pkgrel=3
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
