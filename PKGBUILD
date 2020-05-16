# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>
# Maintainer: Ariel Popper <a@arielp.com>

pkgname=postgresql-lts-old-upgrade
pkgver=10.13
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc='PostgreSQL build for migrating between major versions with pg_upgrade'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
depends=("postgresql-lts-libs>=${_majorver}" 'libxml2' 'openssl>=1.0.0' 'pam' 'zlib' 'icu' 'systemd-libs' 'libldap')
makedepends=('krb5' 'python' 'python2' 'perl' 'tcl>=8.6.0' 'systemd')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2)
sha256sums=('4d701f450cd92ffb123cf6c296e9656abbc2ab7ea6507894ff1e2475ae0754e1')

build() {
  cd postgresql-${pkgver}
  local options=(
    --prefix=/opt/pgsql-${_majorver}
    --with-gssapi
    --with-libxml
    --with-openssl
    --with-perl
    --with-python
    --with-tcl
    --with-pam
    --without-readline
    --with-system-tzdata=/usr/share/zoneinfo
    --with-uuid=e2fs
    --with-icu
    --with-systemd
    --with-ldap
    --disable-nls
    --enable-thread-safety
  )

  # only build plpython3 for now
  ./configure ${options[@]} \
    PYTHON=/usr/bin/python
  make -C src/pl/plpython all
  make -C contrib/hstore_plpython all
  make -C contrib/ltree_plpython all

  # save plpython3 build and Makefile.global
  cp -a src/pl/plpython{,3}
  cp -a contrib/hstore_plpython{,3}
  cp -a contrib/ltree_plpython{,3}
  cp -a src/Makefile.global{,.python3}
  make distclean

  # regular build with everything
  ./configure ${options[@]} \
    PYTHON=/usr/bin/python2
  make -C src all
  make -C contrib all
}

package() {
  cd postgresql-${pkgver}
  make -C src DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  # install plpython3
  mv src/Makefile.global src/Makefile.global.save
  cp src/Makefile.global.python3 src/Makefile.global
  touch -r src/Makefile.global.save src/Makefile.global
  make -C src/pl/plpython3 DESTDIR="${pkgdir}" install
  make -C contrib/hstore_plpython3 DESTDIR="${pkgdir}" install
  make -C contrib/ltree_plpython3 DESTDIR="${pkgdir}" install

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
