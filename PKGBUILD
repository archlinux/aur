# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=krb5-git
pkgver=1.18.2
pkgrel=1
pkgdesc='The Kerberos network authentication system'
url='https://web.mit.edu/kerberos/'
arch=('x86_64')
license=('custom')
depends=('e2fsprogs' 'libldap' 'keyutils')
makedepends=('perl')
provides=(krb5)
conflicts=(krb5)
backup=('etc/krb5.conf' 'var/lib/krb5kdc/kdc.conf')
options=('!emptydirs')
source=("git+https://github.com/krb5/krb5"
        krb5-config_LDFLAGS.patch
        krb5-kadmind.service
        krb5-kdc.service
        krb5-kpropd.service
        krb5-kpropd@.service
        krb5-kpropd.socket)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
#validpgpkeys=('2C732B1C0DBEF678AB3AF606A32F17FD0055C305'  # Tom Yu <tlyu@mit.edu>
#              'C4493CB739F4A89F9852CBC20CBA08575F8372DF') # Greg Hudson <ghudson@mit.edu>

pkgver() {
    cd krb5
    git describe --tags --always  | sed 's/-/+/g'
}

prepare() {
  cd krb5

  # cf https://bugs.gentoo.org/show_bug.cgi?id=448778
  patch -p1 < "${srcdir}"/krb5-config_LDFLAGS.patch

  # FS#25384
  sed -i "/KRB5ROOT=/s/\/local//" src/util/ac_check_krb5.m4
}

build() {
   cd krb5/src
   export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all"
   export CPPFLAGS+=" -I/usr/include/et"

   autoreconf -fi

   ./configure --prefix=/usr \
               --sbindir=/usr/bin \
               --sysconfdir=/etc \
               --localstatedir=/var/lib \
               --enable-shared \
               --with-system-et \
               --with-system-ss \
               --disable-rpath \
               --without-tcl \
               --enable-dns-for-realm \
               --with-ldap \
               --without-system-verto
   make
}

package() {
   cd krb5/src
   make DESTDIR="${pkgdir}" EXAMPLEDIR=/usr/share/doc/krb5/examples install

   # Fix FS#29889
   install -m 644 plugins/kdb/ldap/libkdb_ldap/kerberos.{ldif,schema} \
     "${pkgdir}/usr/share/doc/krb5/examples"

   install -Dpm 644 config-files/krb5.conf -t "${pkgdir}/etc"
   install -Dpm 644 config-files/kdc.conf -t "${pkgdir}/var/lib/krb5kdc"

   install -Dm 644 util/ac_check_krb5.m4 -t "${pkgdir}/usr/share/aclocal"

   install -Dm 644 "${srcdir}"/krb5/NOTICE \
     "${pkgdir}/usr/share/licenses/krb5/LICENSE"

   # systemd stuff
   install -Dm 644 "${srcdir}"/krb5-{kadmind.service,kdc.service,kpropd.service,kpropd@.service,kpropd.socket} \
      -t "${pkgdir}/usr/lib/systemd/system"
}

# vim: ts=2 sw=2 et:
