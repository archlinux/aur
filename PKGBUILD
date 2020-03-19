# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='openvpn-auth-ldap'
_name='auth-ldap'
pkgver='2.0.4'
pkgrel='2'
pkgdesc='OpenVPN Auth via LDAP/AD plugin. RFC2307 support.'
arch=('any')
url="https://github.com/threerings/${pkgname}"
license=('BSD')
depends=('openvpn' 'libldap' 'libsasl' 'openssl')
source=("${url}/archive/${_name}-${pkgver}.tar.gz"
	"77.patch")
makedepends=('gcc-objc' 're2c' 'doxygen')
sha256sums=('81f600cdc88adb2258f57df1ed2d87f0afa945f66cbf8897ad50e76f42509168'
            '003e5acefebc5cdbea5a9513ca8a27f624917a357e72f825dccf4294c375b4f5')
backup=("etc/openvpn/server/${_name}.conf")
_gcc_objc_path="`pacman -Ql gcc-objc | gawk 'match($0, /^gcc-objc\s(\/usr\/lib\/(.*)-gnu\/[0-9.]+\/include\/)$/, a) {print a[1]}'`"

prepare() {
  cd "${srcdir}/${pkgname}-${_name}-${pkgver}"

  # https://github.com/threerings/openvpn-auth-ldap/pull/77
  patch -p1 -i "${srcdir}/77.patch"
  sed -i 's|AC_CONFIG_SRCDIR(${srcdir}/src/auth-ldap.m)|AC_CONFIG_SRCDIR(src/auth-ldap.m)|g' configure.ac
  autoreconf -fvi
  autoheader

  OBJCFLAGS=-I${_gcc_objc_path} \
  ./configure  \
    --with-openvpn="/usr/include/openvpn" \
    --with-objc-runtime="GNU"
}

build() {
  cd "${srcdir}/${pkgname}-${_name}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${_name}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${_name}-${pkgver}"
  install -Dm775 "src/${pkgname}.so" "${pkgdir}/usr/lib/openvpn/plugins/${pkgname}.so"
  install -Dm400 "${_name}.conf" "${pkgdir}/etc/openvpn/server/${_name}.conf"
}
