# Maintainer: a821 <a821 mail de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgbase=postgresql-git
pkgname=('postgresql-git' 'postgresql-libs-git' 'postgresql-docs-git')
pkgver=18.beta1.r2092.ga1bd0c16157
pkgrel=1
pkgdesc='Sophisticated object-relational DBMS'
url='https://www.postgresql.org/'
arch=('x86_64')
license=('PostgreSQL')
depends=(
  'bash'
  'glibc'
  'icu' 'libicui18n.so' 'libicuuc.so'
  'krb5' 'libgssapi_krb5.so'
  'libgcc' 'libgcc_s.so'
  'libldap'
  'libstdc++' 'libstdc++.so'
  'liburing' 'liburing.so'
  'libxml2' 'libxml2.so'
  'libxslt'
  'llvm-libs'
  'lz4' 'liblz4.so'
  'numactl' 'libnuma.so'
  'openssl' 'libcrypto.so' 'libssl.so'
  'pam' 'libpam.so'
  'systemd-libs' 'libsystemd.so'
  'util-linux-libs'
  'zlib' 'libz.so'
  'zstd' 'libzstd.so'
)
makedepends=(
  'clang'
  'docbook-xml'
  'docbook-xsl'
  'git'
  'llvm'
  'perl'
  'perl-ipc-run'
  'python'
  'readline'
  'systemd'
  'tcl'
  'util-linux'
)
source=(git+https://git.postgresql.org/git/postgresql.git
        postgresql-run-socket.patch
        postgresql-perl-rpath.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql-check-db-dir
        postgresql.sysusers
        postgresql.tmpfiles)
sha512sums=('SKIP'
            '9f82c8e6982cc1ab4e5048c485a0c5a75fef32bf610bfeaccb8c4c28bb84ff0ebca8de83efc03044cf98275296babdcd9e12119f5320cedd899285e8a6f48b00'
            '7c38d6b468ad4502b741e72c8e5109c1ef8c561f52d2c4d96a030620659fd4b0e7e3d2438d31273318cef07a6f30f9134e18bb0419e324b40e62c35846b7b6e3'
            '1e6183ab0eb812b3ef687ac2c26ce78f7cb30540f606d20023669ac00ba04075487fb72e4dc89cc05dab0269ff6aca98fc1167cc75669c225b88b592482fbf67'
            '9ab4da01337ffbab8faec0e220aaa2a642dbfeccf7232ef2645bdc2177a953f17ee3cc14a4d8f8ebd064e1dae8b3dba6029adbffb8afaabea383963213941ba8'
            '751f245d213006451d744f1313b29cecd01132bbe0f5b69a7eb522c290db79664d6223422b1adcbcaa6bedfde8f1ca6f59a37ec3a5c53503fde2bcd9bbb900a0'
            'cad03ac77cf4fe74d4390ca14ca68dbad8d7534c68480e4e61926aa7a1d505c5d0a9d8c75e7f54862d833c21721db7b2eda6d4a29d136ccf3a93b34263eb8d3a'
            'c809e1d6307e0686f9e063adc582bcc0bba865f26610be4d8e65ee1b4ddc7908aab6696cd511ccbc54c3ba5963b4640a60e2e5d3e1859239cdb4f3fbaafd8cb2'
            '819faa16edb45a01500c3f5d307528648fffe6d22ba4734b8c1951a2a9491962188413f24e754c922830acef0635720ca355459b65142cd4acb29df08d9c222e')

pkgver() {
  cd postgresql
  git describe --tags | sed 's/REL_//;s/_/./;s/-/.r/;s/-/./g' | tr A-Z a-z
}

prepare() {
  cd postgresql
  patch -p1 < ../postgresql-run-socket.patch
  patch -p1 < ../postgresql-perl-rpath.patch
}

build() {
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
    --with-libcurl
    --with-libnuma
    --with-liburing
    --with-lz4
    --with-zstd
    --disable-rpath
    --enable-nls
    --enable-tap-tests
  )

  # use fat LTO objects for static libraries
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"

  mkdir -p build ; cd build
  ../postgresql/configure "${configure_options[@]}"
  make world
}

check() {
  export LANG=C LC_ALL=C
  if ! make -C build check-world; then
     find . -name regression.diffs | while read -r line; do
        echo "make check-world failure: ${line}"
        cat -- "${line}" || :
     done
  fi
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="${srcdir}/${p}/${f#${pkgdir}/}"
    mkdir -p "$(dirname "${d}")"
    mv "${f}" "${d}"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "${f}")"
  done
}

package_postgresql-git() {
  backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
  depends+=('postgresql-libs-git')
  optdepends=('python: for PL/Python 3 support'
              'perl: for PL/Perl support'
              'tcl: for PL/Tcl support'
              'logrotate: rotates system logs automatically')
  provides=('postgresql')
  conflicts=('postgresql')
  options+=('staticlibs')

  install=postgresql.install

  make -C build DESTDIR="${pkgdir}" install-world

  pushd "$pkgdir"
  _pick libs usr/bin/pg_{config,dump,dumpall,isready,restore}
  _pick libs usr/bin/{cluster,reindex,vacuum}db
  _pick libs usr/bin/{create,drop}{db,user}
  _pick libs usr/bin/{ecpg,psql,vacuumlo}

  _pick libs usr/include/{ecpg,libpq,pg,postgres_,sql}*
  _pick libs usr/include/postgresql/internal

  _pick libs usr/lib/lib*
  _pick libs usr/lib/pkgconfig

  _pick libs usr/share/locale/*/LC_MESSAGES/{ecpg,libpq,pgscripts,psql}*
  _pick libs usr/share/locale/*/LC_MESSAGES/pg_{config,dump}-*

  _pick libs usr/share/man/man1/pg_{config,dump,dumpall,isready,restore}.1
  _pick libs usr/share/man/man1/{cluster,reindex,vacuum}db.1
  _pick libs usr/share/man/man1/{create,drop}{db,user}.1
  _pick libs usr/share/man/man1/{ecpg,psql,vacuumlo}.1

  _pick libs usr/share/postgresql/{pg_service.conf,psqlrc}.sample

  _pick docs usr/share/doc
  popd

  install -Dm 644 postgresql/COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm 755 postgresql-check-db-dir -t "${pkgdir}/usr/bin"

  install -Dm 644 postgresql.pam "${pkgdir}/etc/pam.d/postgresql"
  install -Dm 644 postgresql.logrotate "${pkgdir}/etc/logrotate.d/postgresql"

  install -Dm 644 postgresql.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 postgresql.sysusers "${pkgdir}/usr/lib/sysusers.d/postgresql.conf"
  install -Dm 644 postgresql.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"
}

package_postgresql-libs-git() {
  pkgdesc+=" - client binaries and libraries"
  depends=(
    curl libcurl.so
    glibc
    krb5 libgssapi_krb5.so
    libldap
    lz4 liblz4.so
    openssl libcrypto.so libssl.so
    readline libreadline.so
    zlib libz.so
    zstd libzstd.so
  )
  provides=('postgresql-libs' 'libpq.so' 'libecpg.so' 'libecpg_compat.so' 'libpgtypes.so')
  conflicts=('postgresql-libs')

  mv libs/* "${pkgdir}"

  install -Dm 644 postgresql/COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_postgresql-docs-git() {
  pkgdesc+="- HTML documentation"
  depends=()
  provides=('postgresql-docs')
  conflicts=('postgresql-docs')
  arch=(any)

  mv docs/* "${pkgdir}"

  install -Dm 644 postgresql/COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
