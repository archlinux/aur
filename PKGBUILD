# Maintainer: Mihail Repnenkov <mrepnenkov@gmail.com>
# Contributor: Ivan Agarkov <ivan.agarkov@gmail.com>

pkgbase=('postgresql-1c')
pkgname=('postgresql-libs' 'postgresql-docs' 'postgresql-1c')
pkgver=10.3
_majorver=${pkgver%.*}
pkgrel=3
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python2' 'perl' 'tcl>=8.6.0' 'openssl>=1.0.0' 'pam' 'zlib')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        http://www.r-s-v.ru/1c-patch/1c-patch.tgz
        postgresql-run-socket.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql-check-db-dir)
sha256sums=('6ea268780ee35e88c65cdb0af7955ad90b7d0ef34573867f223f14e43467931a'
            'cb5524cca3acf3775e18f5c2844baba4f39ff3f037614c17e90b5c3ac20b47fa'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            'ad025a5fb623b1a1e9dff0cc62cc63f66244bb27d81370a6251aa29e8574be94'
            '888a1d44f03fccfa4bf344ee45824fefb846ae3c1c0c40113ad6020b4be3b0cf')
sha512sums=('05cf82d3483bdf38734e6ff0fef6b80e7f8fd3cb5ea6792ffe222a599d97d1a29638970bf28ebf5bd1f877e8dcd9986d88f5c5e5379e74fe79ce83e20d2babba'
            '97b25013d5a31211c9bacd641de6f9638cbe4bcc831298eaff0587f4c439cfb5bb294231dc9d3dec90fa51d976885ae3f90e6b08bb397598f40c5e9f364ca471'
            '031efe12d18ce386989062327cdbbe611c5ef1f94e4e1bead502304cb3e2d410af533d3c7f1109d24f9da9708214fe32f9a10ba373a3ca8d507bdb521fbb75f7'
            '1e6183ab0eb812b3ef687ac2c26ce78f7cb30540f606d20023669ac00ba04075487fb72e4dc89cc05dab0269ff6aca98fc1167cc75669c225b88b592482fbf67'
            '9ab4da01337ffbab8faec0e220aaa2a642dbfeccf7232ef2645bdc2177a953f17ee3cc14a4d8f8ebd064e1dae8b3dba6029adbffb8afaabea383963213941ba8'
            'acd60166ff513b16778705e824944945cd0a98abc519fa5f0232252e0e9c85460c6f8b85459d9692d1f3df1caaaf8909c3e7f785be99c2d3fb98a10b2641a795'
            '56974ef34a8d94596068413154b1a7ed5a71f5a3942bd79427f05e6f6b7853036874dedd8d988bb94306023f2a675996d500b075eaf8a192ef5c24026eb28eb0')

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../00001-1c_FULL_100_EXT.patch
  patch -p1 < ../00002-online_analyze.patch
  patch -p1 < ../00003-plantuner.patch
  patch -p1 < ../00004-postgresql-1c-10.patch
  patch -p1 < ../00005-coalesce_cost.patch
  patch -p1 < ../00006-pg_receivewal.patch
}

build() {
  cd postgresql-${pkgver}
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --datadir=/usr/share/postgresql \
    --sysconfdir=/etc \
    --with-gssapi \
    --with-libxml \
    --with-openssl \
    --with-perl \
    --with-python PYTHON=/usr/bin/python2 \
    --with-tcl \
    --with-pam \
    --with-system-tzdata=/usr/share/zoneinfo \
    --with-uuid=e2fs \
    --enable-nls \
    --enable-thread-safety
  make world
}

package_postgresql-libs() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0' 'zlib')
  provides=('postgresql-client')
  conflicts=('postgresql-client')

  cd postgresql-${pkgver}

  # install license
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # install libs and non-server binaries
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    install -Dm 644 doc/src/sgml/man1/${util}.1 "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  cd src/include

  mkdir -p "${pkgdir}"/usr/include/{libpq,postgresql/internal/libpq}

  # these headers are needed by the public headers of the interfaces
  install -m 644 pg_config.h "${pkgdir}/usr/include"
  install -m 644 pg_config_os.h "${pkgdir}/usr/include"
  install -m 644 pg_config_ext.h "${pkgdir}/usr/include"
  install -m 644 postgres_ext.h "${pkgdir}/usr/include"
  install -m 644 libpq/libpq-fs.h "${pkgdir}/usr/include/libpq"
  install -m 644 pg_config_manual.h "${pkgdir}/usr/include"

  # these he aders are needed by the not-so-public headers of the interfaces
  install -m 644 c.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 port.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 postgres_fe.h "${pkgdir}/usr/include/postgresql/internal"
  install -m 644 libpq/pqcomm.h "${pkgdir}/usr/include/postgresql/internal/libpq"
}

package_postgresql-docs() {
  pkgdesc="HTML documentation for PostgreSQL"
  options=('docs')

  cd postgresql-${pkgver}

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html"

  # clean up
  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
  rmdir "${pkgdir}"/usr/share/man
}

package_postgresql-1c() {
  pkgdesc='Sophisticated object-relational DBMS'
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("postgresql-libs>=${pkgver}" 'krb5' 'libxml2' 'readline>=6.0' 'openssl>=1.0.0' 'pam')
  optdepends=('python2: for PL/Python support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade')
  options=('staticlibs')
  install=postgresql.install

  cd postgresql-${pkgver}

  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install
  make -C doc/src/sgml DESTDIR="${pkgdir}" install-man

  # we don't want these, they are in the -libs package
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" uninstall
  done
  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    rm "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  # install license
  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/postgresql/html"

  install -Dm 644 "${srcdir}/postgresql.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 755 "${srcdir}/postgresql-check-db-dir" -t "${pkgdir}/usr/bin"

  install -Dm 644 "${srcdir}/postgresql.pam" "${pkgdir}/etc/pam.d/postgresql"
  install -Dm 644 "${srcdir}/postgresql.logrotate" "${pkgdir}/etc/logrotate.d/postgresql"
}
