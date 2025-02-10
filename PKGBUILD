# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgbase=postgresql
pkgname=(
  'postgresql'
  'postgresql-libs'
  'postgresql-docs'
)
pkgver=16.6
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('PostgreSQL')
depends=(
  'bash'
  'gcc-libs'
  'glibc'
  'icu'
  'krb5'
  'libldap'
  'libxml2'
  'libxslt'
  'llvm-libs'
  'lz4'
  'openssl'
  'pam'
  'readline'
  'systemd-libs'
  'util-linux-libs'
  'zlib'
  'zstd'
)
makedepends=(
  'clang'
  'llvm'
  'perl'
  'perl-ipc-run'
  'python'
  'systemd'
  'tcl'
  'util-linux'
)
source=(
  https://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
  0001-Set-DEFAULT_PGSOCKET_DIR-to-run-postgresql.patch
  0002-Force-RPATH-to-be-used-for-the-PL-Perl-plugin.patch
  postgresql-check-db-dir.in
  postgresql.logrotate
  postgresql.pam
  postgresql.service
  postgresql.sysusers
  postgresql.tmpfiles
)
md5sums=('1dce19ac968da51c99e8fc22c01c0269'
         '6ce1dab3da98a10f9190e6b3037f93aa'
         'd034d00e5717025ffe19eb63a940da71'
         '10123caec61006cbe316de8ab7a497bc'
         'd28e443f9f65a5712c52018b84e27137'
         '96f82c38f3f540b53f3e5144900acf17'
         '026a3dbde1a0b2909120f0012237a33d'
         'da6a0dda84638d0c3463abf4bc01e621'
         '9138244e0e6b98acc770931a4b150b86')
sha256sums=('23369cdaccd45270ac5dcc30fa9da205d5be33fa505e1f17a0418d2caeca477b'
            '4d5a1020626d6cdd8eabbcb54e71d719a8d4cf0228f20173d16a86b374d32acd'
            'fe724fda2f46bacd7d0af5e3011ab031ea21298e8876c5f4fdc32fa1fb1dd9ad'
            '94af93b53bf7772e6664c239523ef952ffc905a0de3c2c4b2dfc2fe8f3a2efed'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '5c23d7741bcd429d9552258decbcb1935febd671c237c1c99b9248dff4838eb8'
            '3cfe36dd202af56b3ef8e6d6a746b24e6f46f0d9e0d3fa125dbfb5e598170afb'
            'ea771830c15b24c8725ded92e6a9ba9848b13f722357c5f5857dfeb21985d54c')
b2sums=('2d6d6efcc4cb0027c03422c839856ac024d3824a7e7da42cafbb961616cdd078064e78b6eb1c98565240ab1f78eb52582f38c9ce80b3a98f9e65568b2c14e40c'
        '283b5a025a3a5ed500317b7a0b8fa9af66816bc7c6a59a90d826e4e8420f9631d41b7219617d63e2c20e58e553bfe715d3b6d31dd3ed3ec07233a7f178dba368'
        '112abd77571734226efd85085b7b562b37ce64c92d8fff576af14dbcf7d42d95653a152050443c8f3bd8183d9ca1b7c6bd722dc5555433f7c5f76ccacf95deb3'
        '682bfab1189221d82f6cce9bcb8c40c6d37ecacbcaf0568bbaa2706503b1f102e5476d0d110dcc6240ab62c5e7c2c20a5d9af8edd4038d212327f8866b1cf15a'
        '2209b7550acad7955102ec6922754b4046b2a2ad2a7e1cfb2cc4053c0705abac7aa7d7968eab617f50894797d06345f51c9a669926bd2a77dcf688206a2027e0'
        '3eab84d332d96678fe6e435ee243c8f1a82b838f601d61d3604d11e918aed7a62202edca5e476c4b9031ed284570e6fcd6c659cfdbd9624aa0019d3233755f81'
        '312c5c877809be46d8823b3a16db6410fb061a3fdc3558710e4921b72886fabe619a49e20a583b9a717771c72dfc8c3575c6e103becf8bb8b9e2d3cdaf6aa3c1'
        'e025e78797879323bb78752dff8ea4eae984015240d273de8e83e1b7f7f7a8b9a549c33df6b72c40721f05a3df149fe065f9bb8c3fdf4f3b9f759963bb3da288'
        'd66fcad8c00ed29cb50cf6721c89023787b42973c3bf50535c4f822a8870883557396b3ec5cc79465e75d0786246a523db69368b2a7feff40c3430c736999cca')

# Upstream provides md5 and sha256

prepare() {
  cd postgresql-${pkgver}
  patch -p1 < ../0001-Set-DEFAULT_PGSOCKET_DIR-to-run-postgresql.patch
  patch -p1 < ../0002-Force-RPATH-to-be-used-for-the-PL-Perl-plugin.patch
}

build() {
  cd postgresql-${pkgver}
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --mandir=/usr/share/man
    --datadir=/usr/share/postgresql
    --disable-rpath
    --enable-nls
    --enable-tap-tests
    --enable-thread-safety
    --with-gssapi
    --with-icu
    --with-ldap
    --with-libxml
    --with-libxslt
    --with-llvm
    --with-lz4
    --with-openssl
    --with-pam
    --with-perl
    --with-python
    --with-readline
    --with-system-tzdata=/usr/share/zoneinfo
    --with-systemd
    --with-tcl
    --with-uuid=e2fs
    --with-zstd
  )

  # Fix static libs
  CFLAGS+=" -ffat-lto-objects"

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
  export LANG=C LC_ALL=C
  cd postgresql-${pkgver}
  _postgres_check check
  _postgres_check check-world
}

package_postgresql() {
  pkgdesc='Sophisticated object-relational DBMS'
  backup=(
    'etc/logrotate.d/postgresql'
    'etc/pam.d/postgresql'
  )
  depends+=("postgresql-libs>=${pkgver}")
  optdepends=(
    'logrotate: rotates system logs automatically'
    'perl: for PL/Perl support'
    'postgresql-old-upgrade: upgrade from previous major version using pg_upgrade'
    'python: for PL/Python 3 support'
    'tcl: for PL/Tcl support'
  )
  options+=('staticlibs')
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

  # clean up unneeded installed items
  rm -rf "${pkgdir}/usr/include/postgresql/internal"
  rm -rf "${pkgdir}/usr/include/libpq"
  find "${pkgdir}/usr/include" -maxdepth 1 -type f -execdir rm {} +
  rmdir "${pkgdir}/usr/share/doc/postgresql/html"

  pushd "${srcdir}"

  sed -e "s/%PGMAJORVERSION%/${_majorver}/g" \
      -e "s/%PREVMAJORVERSION%/$((_majorver - 1))/g" \
      postgresql-check-db-dir.in |
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/postgresql-check-db-dir"

  install -Dm 644 ${pkgname}.pam "${pkgdir}/etc/pam.d/${pkgname}"
  install -Dm 644 ${pkgname}.logrotate "${pkgdir}/etc/logrotate.d/${pkgname}"

  install -Dm 644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  popd

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_postgresql-libs() {
  pkgdesc="Libraries for use with PostgreSQL"
  depends=(
    'glibc'
    'krb5'
    'libldap'
    'lz4'
    'openssl'
    'readline'
    'zlib'
    'zstd'
  )
  provides=(
    'libecpg.so'
    'libecpg_compat.so'
    'libpgtypes.so'
    'libpq.so'
    'postgresql-client'
  )
  conflicts=('postgresql-client')
  options+=('staticlibs')

  cd postgresql-${pkgver}

  # install libs and non-server binaries
  for dir in src/interfaces src/bin/pg_config src/bin/pg_dump src/bin/psql src/bin/scripts; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  for util in pg_config pg_dump pg_dumpall pg_restore psql \
      clusterdb createdb createuser dropdb dropuser pg_isready reindexdb vacuumdb; do
    install -Dm 644 doc/src/sgml/man1/${util}.1 "${pkgdir}"/usr/share/man/man1/${util}.1
  done

  pushd src/include

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

  popd

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_postgresql-docs() {
  pkgdesc="HTML documentation for PostgreSQL"
  depends=()
  options+=('docs')

  cd postgresql-${pkgver}

  make -C doc/src/sgml DESTDIR="${pkgdir}" install-html
  chown -R root:root "${pkgdir}/usr/share/doc/postgresql/html"

  # clean up
  rmdir "${pkgdir}"/usr/share/man/man{1,3,7}
  rmdir "${pkgdir}"/usr/share/man

  install -Dm 644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
