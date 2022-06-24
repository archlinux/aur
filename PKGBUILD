# -*- mode: Shell-script; eval: (setq indent-tabs-mode nil); eval: (setq tab-width 2) -*-
# Maintainer: Dominic meiser <git[at]msrd0[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgbase=postgresql13
pkgname=($pkgbase-libs $pkgbase-docs $pkgbase)
pkgver=13.7
_majorver=${pkgver%.*}
pkgrel=2
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'python' 'perl' 'tcl>=8.6.0' 'openssl>=1.0.0'
             'pam' 'zlib' 'icu' 'systemd' 'libldap' 'llvm' 'clang' 'libxslt')
options=('debug')
source=(https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        eeac7dd9ff76ee7ea1feb2dd6004c5d92c6caca5.patch::'https://git.postgresql.org/gitweb/?p=postgresql.git;a=patch;h=eeac7dd9ff76ee7ea1feb2dd6004c5d92c6caca5'
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql-check-db-dir
        postgresql.sysusers
        postgresql.tmpfiles)
md5sums=('dba6e30a292af33996e84a5b0a3739a4'
         '3a84e90a612b16e68cc44abb661c020b'
         '0f96c09cb07cb5bf7c0f74b399128f33'
         '21816c9949ab9766c409421314045d2e'
         '96f82c38f3f540b53f3e5144900acf17'
         'd28e443f9f65a5712c52018b84e27137'
         '0418d1b78f15b969c1575657d47ab130'
         '38fe206c794e2eff95556947af0e5ce5'
         '2050d34e4dfa05f3c6fe4cd7615eaa4b'
         '02d017978f0bba21f455feceb3f0a45a')
sha256sums=('1b905bf4f3d83614a393b3c51fd345910fd261e4f5124a68d9a1fdd3a2a46399'
            '8f2add45c06afd22df3ed12599830bdf36f559f1807c10d9d2dc127a7198b071'
            '02ffb53b0a5049233f665c873b96264db77daab30e5a2194d038202d815a8e6a'
            'af6186d40128e043f333da4591455bf62b7c96e80214835f5c8c60b635ea9afb'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            '25fb140b90345828dc01a4f286345757e700a47178bab03d217a7a5a79105b57'
            '7db9626c322928b2465aa126b48ba7f0eebd366bf2aa19c9c0a92b488cb469c5'
            '7fa8f0ef3f9d40abd4749cc327c2f52478cb6dfb6e2405bd0279c95e9ff99f12'
            '4a4c0bb9ceb156cc47e9446d8393d1f72b4fe9ea1d39ba17213359df9211da57')
b2sums=('2d8a505f6de4eb31cae415529eeac750a60abafcf45e7fde29043597b385a8150fac55df659f8c2ad200822e8063d388ed606dff9108d4407f9e26b893fa62f4'
        'f56c21b78aa8c6e4da88e3e65a2fd38c5e546278c479197bb4b59f91c7ee61b2e34e82df920979bdadf96b14895f7f64485cb16e238de4087e2f515705df4eab'
        '71dc1b4e41294fd235db05317c991d42de082c49d38a2f97d1394572a93a4aa77f42ec29b4e6cf0a17adb3a4471afcb1e2464870f2b9e847906bf49541763a53'
        '5135c5f9dafe427de8d3740d4a67c6dba2869be47dc52b4190b8aa1148e702992fde1821371b68e93b224f5805f697d490ea28ec80d7ce55e5a224551b0a6247'
        '3eab84d332d96678fe6e435ee243c8f1a82b838f601d61d3604d11e918aed7a62202edca5e476c4b9031ed284570e6fcd6c659cfdbd9624aa0019d3233755f81'
        '2209b7550acad7955102ec6922754b4046b2a2ad2a7e1cfb2cc4053c0705abac7aa7d7968eab617f50894797d06345f51c9a669926bd2a77dcf688206a2027e0'
        'a4255df47b7ac1418d20aa73aa0f6e70c7952a10d706e5523043c48b2c3b6d8e39838049dfcc826913cd0f2c06502561d1abe8b19cce7071db66139ae93a37bf'
        '2eaf8867cc71b8e838925e1e1e2c37b5edd69c3fe7c144410a8683662ba0c342122803217d436d808e18826d28da352978e5d15dd1bc91b6b44dbaf4cfcd4d51'
        '5e9cba2f45604db83eb77c7bbb54bc499a38274be6cd97abb056c9bdf18e637a8ac354e18f41f614f7e1a2d6f13c2a0b562ab0aaebf9447cf5eb2d60e6501e12'
        '8a8e5ec24ea338b2b51b8d2be5a336ac8d4cc6b25200ed0f0d564df9942997478df0c54da2fac7b27d677774a34398f69047eecd0f97bdc0df8fe50a1b5ed74d')

# Upstream provides md5 and sha256

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../eeac7dd9ff76ee7ea1feb2dd6004c5d92c6caca5.patch
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
}

build() {
  cd postgresql-${pkgver}
  local configure_options=(
    --prefix=/usr
    --mandir=/usr/share/man
    --datadir=/usr/share/postgresql
    --sysconfdir=/etc
    --with-gssapi
    --with-libxml
    --with-openssl
    --with-perl
    --with-python
    --with-tcl
    --with-pam
    --with-readline
    --with-system-tzdata=/usr/share/zoneinfo
    --with-uuid=e2fs
    --with-icu
    --with-systemd
    --with-ldap
    --with-llvm
    --with-libxslt
    --enable-nls
    --enable-thread-safety
    --disable-rpath
  )

  # Fix static libs
  # configure thinks it needs to parse clang's output, but clang issues a warning
  # that it doesn't recognize -ffat-lto-objects which configure finds unacceptable
  # so I don't know why this was added, but I can't keep this
  #CFLAGS+=" -ffat-lto-objects"

  ./configure "${configure_options[@]}"
  make world
}

_postgres_check() {
  make "${1}" || (find . -name regression.diffs | \
    while read -r line; do
      echo "make ${1} failure: ${line}"
      cat "${line}"
    done; exit 1)
}

check() {
  cd postgresql-${pkgver}
  _postgres_check check
  _postgres_check check-world
}

package_postgresql13-libs() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=('krb5' 'openssl>=1.0.0' 'readline>=6.0' 'zlib' 'libldap')
  provides=('postgresql-client' "postgresql-libs=$pkgver" 'libpq.so' 'libecpg.so' 'libecpg_compat.so' 'libpgtypes.so')
  conflicts=('postgresql-client' 'postgresql-libs')

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

  install -d "${pkgdir}"/usr/include/{libpq,postgresql/internal/libpq}

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

package_postgresql13-docs() {
  pkgdesc="HTML documentation for PostgreSQL"
  options+=('docs')
  provides=("postgresql-docs=$pkgver")
  conflicts=('postgresql-docs')

  cd postgresql-${pkgver}

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html"

  # clean up
  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
  rmdir "${pkgdir}"/usr/share/man
}

package_postgresql13() {
  pkgdesc='Sophisticated object-relational DBMS'
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends=("postgresql-libs>=${pkgver}" 'krb5' 'libxml2' 'readline>=6.0'
           'openssl>=1.0.0' 'pam' 'icu' 'systemd-libs' 'libldap' 'llvm-libs' 'libxslt')
  optdepends=('python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade'
              'logrotate: rotates system logs automatically')
  options+=('staticlibs')
  install=postgresql.install
  provides=("postgresql=$pkgver")
  conflicts=('postgresql')

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

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}"
  install -Dm 755 postgresql-check-db-dir -t "${pkgdir}/usr/bin"

  install -Dm 644 postgresql.pam "${pkgdir}/etc/pam.d/postgresql"
  install -Dm 644 postgresql.logrotate "${pkgdir}/etc/logrotate.d/postgresql"

  install -Dm 644 postgresql.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 postgresql.sysusers "${pkgdir}/usr/lib/sysusers.d/postgresql.conf"
  install -Dm 644 postgresql.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/postgresql/html"
}
