# Maintainer:
# Contributor: Comete <la_comete@tiscali.fr>

pkgname=pam_ldap
pkgver=186
pkgrel=10
pkgdesc="LDAP authentication module for the PAM framework"
arch=('x86_64')
url="http://www.padl.com/OSS/pam_ldap.html"
license=('LGPL')
depends=('libldap' 'pam')
backup=('etc/pam_ldap.conf')
options=('!makeflags')
#source=("https://www.padl.com/download/${pkgname}-${pkgver}.tar.gz")
source=("https://sources.archlinux.org/other/packages/pam_ldap/$pkgname-$pkgver.tar.gz" "pam_ldap-reproducible.patch")
md5sums=('58c8689921c5c4578363438acd8503c2'
         'a79a0629fe04eaa350e0a94f00dde7c8')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/pam_ldap-reproducible.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --libdir=/usr/lib \
      --with-ldap-conf-file=/etc/pam_ldap.conf \
      --mandir=/usr/share/man
  PERL5LIB="$PWD" PATH="${PATH}:${srcdir}/${pkgname}-${pkgver}" make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/etc/ldap.conf" "${pkgdir}/etc/pam_ldap.conf"
}
