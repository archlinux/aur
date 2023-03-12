pkgname=heimdal-git
pkgdesc="Heimdal, an implementation of Kerberos and PKIX"
_commit='b19633f9b94fbfff3777a432d02e0bf5405f372b'
pkgver=7.99.r30417.gb19633f9b
pkgrel=1
url="https://www.heimdal.software/"
arch=(x86_64)
depends=(libcap-ng readline sqlite)
makedepends=(git libldap perl-json)
optdepends=(libldap)
provides=(heimdal=$pkgver)
source=("git+https://github.com/heimdal/heimdal#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('E65941B71CF3C459A34FA89C45E7572A28CD8CC8')

pkgver() {
  cd heimdal
  local ver='7.99'
  #local ver=$({ echo 'changequote([,])dnl'
  #              echo 'define(AC_INIT,$2)dnl'
  #              grep '^AC_INIT(.*)' configure.ac; } | m4)
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
