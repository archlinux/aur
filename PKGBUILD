# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Florian Pritz <flo@xinu.at>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_pkgbasename=krb5
pkgname=lib32-${_pkgbasename}-minimal-git
pkgver=1.18.3
pkgrel=1
pkgdesc='The Kerberos network authentication system (32-bit)'
url='https://web.mit.edu/kerberos/'
arch=('x86_64')
license=('custom')
depends=('lib32-e2fsprogs' 'lib32-keyutils' "${_pkgbasename}")
makedepends=('perl')
provides=(lib32-krb5)
conflicts=(lib32-krb5)
options=('!emptydirs')
source=("git+https://github.com/krb5/krb5"
        krb5-config_LDFLAGS.patch)
sha512sums=('SKIP'
            'SKIP')
#validpgpkeys=('2C732B1C0DBEF678AB3AF606A32F17FD0055C305'  # Tom Yu <tlyu@mit.edu>
#              'C4493CB739F4A89F9852CBC20CBA08575F8372DF') # Greg Hudson <ghudson@mit.edu>

pkgver() {
    cd krb5
    git describe --tags --always | sed 's/-/+/g'
}

prepare() {
   cd krb5

   # cf https://bugs.gentoo.org/show_bug.cgi?id=448778
   patch -p1 < "${srcdir}"/krb5-config_LDFLAGS.patch

  # FS#25384
  sed -i "/KRB5ROOT=/s/\/local//" src/util/ac_check_krb5.m4
}

build() {
   cd "${srcdir}/krb5/src"

   export CC="gcc -m32"
   export CXX="g++ -m32"
   export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

   export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all"
   export CPPFLAGS+=" -I/usr/include/et"

   autoreconf -fi

   ./configure --prefix=/usr \
               --sysconfdir=/etc \
               --localstatedir=/var/lib \
               --libdir=/usr/lib32 \
               --enable-shared \
               --with-system-et \
               --with-system-ss \
               --disable-rpath \
               --without-tcl \
               --enable-dns-for-realm \
               --without-ldap \
               --without-vague-errors \
               --disable-audit-plugin \
               --disable-asan \
               --without-lmdb \
               --without-system-verto
   make
}

#check() {
   # We can't do this in the build directory.

   # only works if the hostname is set properly/resolves to something. whatever...
   #cd "${srcdir}/${_pkgbasename}-${pkgver}"
   #make -C src check
#}

package() {
   cd krb5/src
   make DESTDIR="${pkgdir}" install

   rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
   install -d "${pkgdir}/usr/share/licenses"
   ln -s krb5 "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
