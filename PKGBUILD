pkgname=heimdal-git
pkgdesc="Heimdal, an implementation of Kerberos and PKIX"
_commit='bcbe816962f0f19112f5398cc0a770a7cfacf325'
pkgver=7.99.1.r30688.gbcbe81696
pkgrel=1
url="https://www.heimdal.software/"
arch=(x86_64)
depends=(libcap-ng readline sqlite)
makedepends=(git libldap perl-json)
optdepends=(libldap)
provides=(heimdal=$pkgver)
source=("git+https://github.com/heimdal/heimdal#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd heimdal
  local ver=$({ echo 'changequote([,])dnl'
                echo 'define(AC_INIT,$2)dnl'
                grep '^AC_INIT(.*)' configure.ac; } | m4)
  local rev=$(git rev-list --count HEAD)
  local git=$(git rev-parse --short HEAD)
  echo "$ver.r$rev.g$git"
}

prepare() {
  cd heimdal
  ./autogen.sh
}

build() {
  cd heimdal
  ./configure \
    --prefix="/usr/heimdal" \
    --sbindir="/usr/heimdal/bin" \
    --enable-hdb-openldap-module \
    --enable-kcm \
    ;
  make
}

package() {
  cd heimdal
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
