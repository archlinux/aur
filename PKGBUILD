# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='openvpn-auth-ldap'
pkgver='2.0.3'
pkgrel='6'
pkgdesc='OpenVPN Auth via LDAP/AD plugin. RFC2307 support.'
arch=('any')
url="https://github.com/threerings/${pkgname}"
license=('BSD')
depends=('openvpn' 'libldap' 'libsasl' 'openssl')
source=("${pkgname}::git+${url}")
makedepends=('gcc-objc' 're2c' 'doxygen' 'git')
sha256sums=('SKIP')
backup=("etc/openvpn/server/auth-ldap.conf")
_gcc_objc_path="`pacman -Ql gcc-objc | gawk 'match($0, /^gcc-objc\s(\/usr\/lib\/(.*)-gnu\/[0-9.]+\/include\/)$/, a) {print a[1]}'`"

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 's|AC_CONFIG_SRCDIR(${srcdir}/src/auth-ldap.m)|AC_CONFIG_SRCDIR(src/auth-ldap.m)|g' configure.ac
  autoreconf -fvi
  autoheader
  
  OBJCFLAGS=-I${_gcc_objc_path} \
  ./configure  \
    --with-openvpn="/usr/include/openvpn" \
    --with-objc-runtime="GNU"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm775 "src/${pkgname}.so" "${pkgdir}/usr/lib/openvpn/plugins/${pkgname}.so"
  install -Dm400 "auth-ldap.conf" "${pkgdir}/etc/openvpn/server/auth-ldap.conf"
}
