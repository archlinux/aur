# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_ldap='auth-ldap'
pkgname='openvpn-auth-ldap'
pkgver='2.0.3'
pkgrel='5'
pkgdesc='OpenVPN Auth via LDAP/AD plugin. RFC2307 support.'
arch=('any')
url='https://github.com/threerings/openvpn-auth-ldap'
license=('BSD')
depends=('openvpn' 'gnustep-base' 'libldap')
makedepends=('gcc-objc' 'gnustep-base' 're2c' 'doxygen' 'autoconf' 'libldap')
source=("${pkgname}.tar.gz::${url}/archive/${_ldap}-${pkgver}.tar.gz"
	"auth-ldap-2.0.3-STARTTLS_before_auth.patch"
	"auth-ldap-2.0.3-README.patch"
	"auth-ldap-2.0.3-tools-CFLAGS.patch"
	"auth-ldap-2.0.3-gnustep.patch"
	"auth-ldap-2.0.3-remoteAddress.patch"
	"auth-ldap-2.0.3-rfc2307.patch")
sha256sums=('3bafd6733513d8d824cfc84e308dfa91b2ed021b67892fc7488962cb9f94d283'
            'a04bf0e2bbdc364a61df0521fc44ec58550e40a363fdb0fa7b1f666386dfa291'
            'c82a36fa3242ff6f6e4ee6aedbe85ad557f4ea56b2f91ba0cb72672bf08d8b73'
            '40d463bcd50995edd4b052ce4a3c88243b1602214b5df7c60fd0b83418f92371'
            'a67f846c6ad4a06fc2b48656a16067094ad903e5afa73736a6f865459a8055a9'
            '7e2a68566f8cf056ee0977245789ccda7d0155165711da16e33da46a8a07f9cb'
            'ba7b00697baaebab9bf303bc5fd84f8da355115fa94ceb9884bc1c5c24aca4c0')
backup=("etc/openvpn/auth-ldap.conf")

prepare() {
  cd "${srcdir}/${pkgname}-${_ldap}-${pkgver}"

  patch -p1 -i "${srcdir}/auth-ldap-2.0.3-STARTTLS_before_auth.patch"
  patch -p1 -i "${srcdir}/auth-ldap-2.0.3-README.patch"
  patch -p1 -i "${srcdir}/auth-ldap-2.0.3-tools-CFLAGS.patch"
  patch -p0 -i "${srcdir}/auth-ldap-2.0.3-gnustep.patch"
  patch -p1 -i "${srcdir}/auth-ldap-2.0.3-remoteAddress.patch"
  patch -p1 -i "${srcdir}/auth-ldap-2.0.3-rfc2307.patch"

  autoreconf
  autoheader
  ./configure \
    --prefix=/usr \
    --with-openvpn=/usr/include \
    --with-objc-runtime=modern
}

build() {
  cd "${srcdir}/${pkgname}-${_ldap}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_ldap}-${pkgver}"
  install -Dm775 "src/${pkgname}.so" "${pkgdir}/usr/lib/openvpn/plugins/${pkgname}.so"
  install -Dm400 "${_ldap}.conf" "${pkgdir}/etc/openvpn/${_ldap}.conf"
}
