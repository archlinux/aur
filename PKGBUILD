# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgbase=openldap-gnutls
pkgname=('openldap-gnutls' 'libldap-gnutls')
pkgver=2.6.9
pkgrel=1
arch=('x86_64')
url="https://www.openldap.org/"
license=('custom')
makedepends=('libtool' 'libsasl' 'util-linux' 'chrpath' 'unixodbc' 'libsodium' 'systemd')
options=('!makeflags' 'emptydirs')
source=(
  https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${pkgver}.tgz
  openldap.tmpfiles
  openldap.sysusers)
sha256sums=('2cb7dc73e9c8340dff0d99357fbaa578abf30cc6619f0521972c555681e6b2ff'
            '0be46138e53ff2fa6d4b4c06bfbdd2100426e0bd2ed29bf3419ade6b5974e9a0'
            'c6e3fa72138edfebb4ecb17f677e217c885ff9eef805b5c8ad1c09169bb0ff8e')
options=(!lto)

# extra modules found in contrib/slapd-modules
_extra_modules=(
  'nssov'
  'autogroup'
  'lastbind'
  'passwd/sha2'
  'allowed'
  'noopsrch'
)

prepare() {
  cd openldap-${pkgver}

  # change perms from 0644 to 0755
  sed -i 's|-m 644 $(LIBRARY)|-m 755 $(LIBRARY)|' libraries/{liblber,libldap}/Makefile.in

  # change rundir to /run/openldap
  sed -i 's|#define LDAPI_SOCK LDAP_RUNDIR LDAP_DIRSEP "run" LDAP_DIRSEP "ldapi"|#define LDAPI_SOCK LDAP_DIRSEP "run" LDAP_DIRSEP "openldap" LDAP_DIRSEP "ldapi"|' include/ldap_defaults.h
  sed -i 's|%LOCALSTATEDIR%/run|/run/openldap|' servers/slapd/slapd.{conf,ldif}
  sed -i 's|-$(MKDIR) $(DESTDIR)$(localstatedir)/run|-$(MKDIR) $(DESTDIR)/run/openldap|' servers/slapd/Makefile.in

  # modify upstream systemd service
  sed -i -e "s|EnvironmentFile.*|EnvironmentFile=-/etc/conf.d/slapd|" -e "s/slapd -d 0/\0 -u ldap -g ldap/" servers/slapd/slapd.service
}

build() {
  cd openldap-${pkgver}
  autoconf
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var/lib/openldap \
    --sbindir=/usr/bin \
    --enable-dynamic \
    --enable-syslog \
    --enable-ipv6 \
    --enable-local \
    --enable-crypt \
    --enable-spasswd \
    --enable-modules \
    --enable-backends \
    --enable-argon2 \
    --with-argon2=libsodium \
    --disable-wt \
    --enable-overlays=mod \
    --with-cyrus-sasl \
    --with-tls=gnutls \
    --enable-autoca=no \
    --with-threads

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make

  # build extra modules
  for module in "${_extra_modules[@]}"; do
    make -C "contrib/slapd-modules/$module" \
      OPT="$CFLAGS $CPPFLAGS" \
      prefix=/usr \
      libexecdir=/usr/lib \
      sysconfdir=/etc/openldap
  done
}

check() {
  cd openldap-${pkgver}
  make test
}

package_libldap-gnutls() {
  pkgdesc="Lightweight Directory Access Protocol (LDAP) client libraries compiled with gnutls"
  provides=('libldap')
  conflicts=('libldap')
  depends=('libsasl' 'gnutls')
  backup=('etc/openldap/ldap.conf')

  cd openldap-${pkgver}
  for dir in include libraries doc/man/man3 ; do
    pushd ${dir}
    make DESTDIR="${pkgdir}" install
    popd
  done
  install -Dm644 -t "$pkgdir/usr/share/man/man5" doc/man/man5/ldap.conf.5

  # remove duplicate conf files
  rm "${pkgdir}"/etc/openldap/*.default

  # shared library versioning
  ln -sf liblber.so "${pkgdir}"/usr/lib/liblber.so.2
  ln -sf libldap.so "${pkgdir}"/usr/lib/libldap.so.2

  # license
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_openldap-gnutls() {
  pkgdesc="Lightweight Directory Access Protocol (LDAP) client and server compiled with gnutls"
  provides=('openldap')
  conflicts=('openldap')
  depends=("libldap-gnutls>=${pkgver}" 'libtool' 'unixodbc' 'perl' 'systemd-libs' 'libsodium')
  backup=('etc/openldap/slapd.conf' 'etc/openldap/slapd.ldif')

  cd openldap-${pkgver}
  for dir in clients servers doc/man/man{1,5,8}; do
    pushd ${dir}
    make DESTDIR="${pkgdir}" install
    popd
  done

  # install extra modules
  for module in "${_extra_modules[@]}"; do
    make -C "contrib/slapd-modules/$module" \
      prefix=/usr \
      libexecdir=/usr/lib \
      sysconfdir=/etc/openldap \
      DESTDIR="$pkgdir" install

    # passwd/sha2 has no man page, so skip it
    if [ -f "contrib/slapd-modules/$module/slapo-$module.5" ]; then
      install -m644 -t "$pkgdir/usr/share/man/man5" \
        "contrib/slapd-modules/$module/slapo-$module.5"
    fi
  done

  # should be in libldap package
  rm "${pkgdir}"/usr/share/man/man5/ldap.conf.5

  # let systemd-tmpfiles generate this directory
  rm -r "${pkgdir}"/run

  # get rid of duplicate conf files
  rm "${pkgdir}"/etc/openldap/*.default

  ln -s ../lib/slapd "${pkgdir}"/usr/bin/slapd

  chown root:439 "${pkgdir}"/etc/openldap/slapd.{conf,ldif}
  chmod 640 "${pkgdir}"/etc/openldap/slapd.{conf,ldif}

  # systemd integration
  install -Dm644 "${srcdir}"/openldap.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/openldap.conf
  install -Dm644 "${srcdir}"/openldap.sysusers "${pkgdir}"/usr/lib/sysusers.d/openldap.conf

  # license
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/"${pkgname}" LICENSE
}
