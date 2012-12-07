# $Id: PKGBUILD 172926 2012-12-06 22:03:52Z dan $
# Upstream Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbase=postgresql
pkgbase=binx32-postgresql
pkgname='binx32-postgresql'
true && pkgname=('libx32-postgresql-libs' 'binx32-postgresql')
pkgver=9.2.2
_majorver=${pkgver%.*}
pkgrel=1.1
arch=('x86_64')
url="http://www.postgresql.org/"
license=('custom:PostgreSQL')
makedepends=('libx32-krb5' 'libx32-libxml2' 'binx32-python2' 'binx32-perl' 'binx32-tcl' 'libx32-openssl>=1.0.0' 'libx32-pam')
source=(http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        x32.patch
        postgresql-run-socket.patch
        postgresql.rcd postgresql.confd postgresql.logrotate
        postgresql.service postgresql.tmpfiles.conf postgresql-check-db-dir)
md5sums=('1cc388988e69bf75c6b55d59070100f6'
         'e7fcec0b799f776e06c7400fab13302a'
         '170486b408ad3b6b24ae91b9196cb004'
         'df507dd37a17a9cb42c1c87056b967a6'
         '0c0bb88e00672c379e1bf4fad362b95f'
         '951d1306d84450d603c47318833bb99d'
         '22809c2ab5f733b51abcef82f315b31c'
         '1201fbe01866d7fd137158c3dbc5f99d'
         'f138ddd82028bfe93f53bcbb3b089fd2')
sha256sums=('e1a7a854a98896cb7fcd1696a76fca6f3bcac94d75e68a6154ffe2b69184f7f3'
            '15e068dd4896f56eaafd405945c5b57d0b9812e790328d8fc96dc1cbcb3cb10e'
            'f8c444140755e99b1ffd808404bda77c360c2843d13f6270b8dbd067d129b33a'
            'ddc9c2bc96efc5cb1a33875081446a71a0701bcbe0ebdbfc1aa3331563633687'
            '343abe98c77e6be000d3996a1312cb6b0b00f3b83c84d3f1c753c6a5a86f9fec'
            'cc766679b3f1dd1e1fe1d4428b747ab44b8778c4127dc011cafd491842756e41'
            '89b061802eee198218c2936ca02ac61be90c46a3e76ebbe2ffa2f60c1cf07cba'
            '3915be673f6f19f8c60e0df3405ca765addceac44e6da144db604efcbf0f4d04'
            'f0f3da47778bae1030986441c63f1b2a7f053d63820e13955ab5664086c92e13')

build() {
  cd "${srcdir}/postgresql-${pkgver}"

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export CFLAGS="--include=/usr/include/python2.7/pyconfig-x32.h"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  patch -Np1 < ../postgresql-run-socket.patch
  patch -Np1 < ../x32.patch

  ./configure --prefix=/usr \
  --libdir=/usr/libx32 \
  --mandir=/usr/share/man \
  --datadir=/usr/share/postgresql \
  --sysconfdir=/etc \
  --with-krb5 \
  --with-libxml \
  --with-openssl \
  --with-perl PERL=/usr/bin/perl-x32 \
  --with-python PYTHON=/usr/bin/python2-x32 \
  --with-tcl TCLSH=/usr/bin/tclsh-x32 \
  --with-pam \
  --with-system-tzdata=/usr/share/zoneinfo \
  --with-pgport=5433 \
  --enable-nls \
  --enable-thread-safety

  make world
}

package_libx32-postgresql-libs() {
  pkgdesc="Libraries for use with PostgreSQL (x32 ABI)"
  depends=('libx32-krb5' 'libx32-openssl>=1.0.0' 'libx32-readline>=6.0')
  provides=('binx32-postgresql-client')
  conflicts=('binx32-postgresql-client')

  cd "${srcdir}/postgresql-${pkgver}"

  # install libs
  for dir in src/interfaces src/bin/pg_config src/bin/psql; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  for _x in ${pkgdir}/usr/bin/*; do mv $_x $_x-x32; done
  rm -rf "${pkgdir}"/usr/{share,include}

  cd src/include

  mkdir -p "${pkgdir}"/usr/include

  # these headers are needed by the public headers of the interfaces
  install -m644 pg_config.h "${pkgdir}/usr/include/pg_config-x32.h"
  # TODO: below?
  install -m644 pg_config_manual.h "${pkgdir}/usr/include/pg_config_manual-x32.h"

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s postgresql-libs "${pkgdir}"/usr/share/licenses/libx32-postgresql-libs

}

package_binx32-postgresql() {
  pkgdesc="A sophisticated object-relational DBMS (x32 ABI)"
  backup=('etc/conf.d/postgresql-x32' 'etc/logrotate.d/postgresql-x32')
  depends=("libx32-postgresql-libs>=${pkgver}" 'libx32-krb5' 'libx32-libxml2' 'libx32-readline>=6.0' 'libx32-openssl>=1.0.0' "${_pkgbase}>=9.2")
  optdepends=('binx32-python2: for PL/Python support'
              'binx32-perl: for PL/Perl support'
              'binx32-tcl: for PL/Tcl support'
              'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade')
  install=postgresql.install

  cd "${srcdir}/postgresql-${pkgver}"

  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install
  make -C doc/src/sgml DESTDIR="${pkgdir}" install-man

  # we don't want these, they are in the -libs package
  for dir in src/interfaces src/bin/pg_config src/bin/psql; do
    make -C ${dir} DESTDIR="${pkgdir}" uninstall
  done

  rm -rf "${pkgdir}/usr/share"

  # install license
  install -dm755 "${pkgdir}/usr/share/licenses/"
  ln -s ${_pkgbase} "${pkgdir}/usr/share/licenses/binx32-postgresql"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql-x32/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rm "${pkgdir}/usr/bin/"{pltcl_delmod,pltcl_listmod,pltcl_loadmod,postmaster}

  # install launch script
  install -D -m755 "${srcdir}/postgresql.rcd" "${pkgdir}/etc/rc.d/postgresql-x32"
  install -D -m644 "${srcdir}/postgresql.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/postgresql-x32.conf"
  install -D -m644 "${srcdir}/postgresql.service" \
    "${pkgdir}/usr/lib/systemd/system/postgresql-x32.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"
  ln -s postgres-x32 "${pkgdir}/usr/bin/postmaster"
  for _x in ${pkgdir}/usr/bin/*; do mv $_x $_x-x32; done

  # install conf file
  install -D -m644 "${srcdir}/postgresql.confd" \
    "${pkgdir}/etc/conf.d/postgresql-x32"

  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql-x32"
}
