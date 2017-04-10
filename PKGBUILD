# Submitter: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>

_pkgname=olm
pkgname=libolm-git
pkgver=2.2.2.r6.g001dc1e
pkgrel=1
pkgdesc='An implementation of a well known cryptographic ratchet in C++'
arch=('i686' 'x86_64' 'armv7h')
url="https://matrix.org/git/olm/"
license=('Apache')
depends=('gcc-libs')
makedepends=('git')
conflicts=('libolm')
provides=('libolm')
source=("$_pkgname::git+https://matrix.org/git/olm")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

check() {
  local flags='' major='' minor='' patch=''
  major="${pkgver%%.*}"
  minor="${pkgver#${major}.}"; minor="${minor%%.*}"
  patch="${pkgver#${major}.}"; patch="${patch#${minor},}"; patch="${patch%%.*}"
  flags+="-O2 -Iinclude -Itests/include -Ilib "
  flags+="-DOLMLIB_VERSION_MAJOR=${major} "
  flags+="-DOLMLIB_VERSION_MINOR=${minor} "
  flags+="-DOLMLIB_VERSION_PATCH=${patch} "
  cd "$srcdir/$_pkgname"
  make test CPPFLAGS+="$flags" DEBUG_OPTIMIZE_FLAGS=''
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sts=2 sw=2 et:
