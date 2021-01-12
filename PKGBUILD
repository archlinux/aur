# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgbasename=keyutils
pkgname=lib32-$_pkgbasename-git
pkgver=1.6.3
pkgrel=1
pkgdesc='Linux Key Management Utilities (32-bit)'
arch=('x86_64')
url='https://www.kernel.org/'
license=('GPL2' 'LGPL2.1')
depends=('lib32-glibc' 'lib32-krb5' "${_pkgbasename}")
makedepends=('git' 'gcc-multilib')
provides=(lib32-keyutils)
conflicts=(lib32-keyutils)
#validpgpkeys=('A86E54B0D5E1B4E0AB7C640FFBB7576BA7CB0B6B') # David Howells <dhowells@redhat.com>
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git")
sha512sums=('SKIP')

_commit() {
  # Convert HEAD into a shortened commit id:
  git rev-parse --short HEAD
}

pkgver() {
  cd keyutils

  # Suggestions for improvement welcome!
  printf '%s.r%s.%s'         \
  "$(_commit)"
}

build() {
  cd "${_pkgbasename}"
  
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  sed -i -e 's/^\(USR\)\?LIBDIR\s*:=.*$/\1LIBDIR=\/usr\/lib32/' Makefile
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${_pkgbasename}"
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/{usr/{include,share,bin,sbin},etc,{s,}bin}
}
