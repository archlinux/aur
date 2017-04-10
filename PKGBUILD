# Submitter: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>

_pkgname=olm
pkgname=libolm
pkgver=2.2.0
pkgrel=1
pkgdesc='An implementation of a well known cryptographic ratchet in C++'
arch=('i686' 'x86_64' 'armv7h')
url="https://matrix.org/git/olm/"
license=('Apache')
depends=('gcc-libs')
source=("https://matrix.org/git/$_pkgname/snapshot/$_pkgname-$pkgver.tar.bz2")
sha256sums=('da7203b21dcdaec55db71025c2f4e9b348d3e5188bd0de2714de6a2f5fac1c5f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

check() {
  local flags='' minor="${pkgver%.*}"; minor="${minor#*.}"
  flags+="-O2 -Iinclude -Itests/include -Ilib "
  flags+="-DOLMLIB_VERSION_MAJOR=${pkgver%%.*} "
  flags+="-DOLMLIB_VERSION_MINOR=${minor} "
  flags+="-DOLMLIB_VERSION_PATCH=${pkgver##*.} "
  cd "$srcdir/$_pkgname-$pkgver"
  make test CPPFLAGS+="$flags" DEBUG_OPTIMIZE_FLAGS=''
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sts=2 sw=2 et:
