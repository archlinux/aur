# Maintainer:

pkgname=libldap-2.5
pkgver=2.5.18
pkgrel=1
pkgdesc="Lightweight Directory Access Protocol (LDAP) client libraries"
arch=('x86_64')
url="https://www.openldap.org/"
license=('custom')
makedepends=('libtool' 'libsasl' 'e2fsprogs' 'util-linux' 'chrpath' 'unixodbc' 'libsodium')
depends=('libsasl' 'e2fsprogs')
options=('!makeflags' 'emptydirs')
source=(https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${pkgver}.tgz)
sha256sums=('2670ae43d8d99dd6b1ba182101d982350d613d09c098eb1607ea6b36e6b51d3e')

prepare() {
  cd openldap-${pkgver}
}

build() {
  cd openldap-${pkgver}
  autoconf
  CFLAGS="${CFLAGS} -DLDAP_CONNECTIONLESS" ./configure --prefix=/usr --libexecdir=/usr/lib \
    --sysconfdir=/etc --localstatedir=/var/lib/openldap --sbindir=/usr/bin \
    --enable-dynamic --enable-syslog --enable-ipv6 --enable-local \
    --enable-crypt --enable-spasswd --enable-modules \
    --enable-backends --disable-ndb --enable-overlays=mod \
    --with-cyrus-sasl --with-threads --disable-bdb --disable-hdb \
    --disable-wt --enable-static=no

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make

  #make -C contrib/slapd-modules/nssov OPT="$CFLAGS $CPPFLAGS" prefix=/usr libexecdir=/usr/lib sysconfdir=/etc/openldap
  #make -C contrib/slapd-modules/autogroup OPT="$CFLAGS $CPPFLAGS" prefix=/usr libexecdir=/usr/lib sysconfdir=/etc/openldap
  #make -C contrib/slapd-modules/lastbind OPT="$CFLAGS $CPPFLAGS" prefix=/usr libexecdir=/usr/lib sysconfdir=/etc/openldap
  #make -C contrib/slapd-modules/passwd/sha2 OPT="$CFLAGS $CPPFLAGS" prefix=/usr libexecdir=/usr/lib sysconfdir=/etc/openldap
  #make -C contrib/slapd-modules/passwd/argon2 OPT="$CFLAGS $CPPFLAGS" prefix=/usr libexecdir=/usr/lib sysconfdir=/etc/openldap
}

package() {
  cd openldap-${pkgver}
  for dir in libraries; do
    pushd ${dir}
    make DESTDIR="${pkgdir}" install
    popd
  done

  # get rid of duplicate default conf files
  rm "${pkgdir}"/etc/openldap/*.default

  rm "${pkgdir}"/usr/lib/{liblber.so,libldap.so}

  rm "${pkgdir}"/etc/openldap/ldap.conf

  rm "${pkgdir}"/usr/lib/pkgconfig/{lber.pc,ldap.pc}


  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
