# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='openvpn-auth-ldap'
_name='auth-ldap'
pkgver='2.0.4'
pkgrel='5'
pkgdesc='OpenVPN Auth via LDAP/AD plugin. RFC2307 support'
arch=('any')
url="https://github.com/threerings/${pkgname}"
license=('BSD')
depends=('openvpn' 'libldap' 'libsasl' 'openssl')
source=("${url}/archive/refs/tags/${_name}-${pkgver}.tar.gz"
	"${url}/pull/73.patch"
	"${url}/pull/74.patch"
	"${url}/pull/75.patch"
	"${url}/pull/77.patch"
	"${url}/pull/85.patch"
	"${url}/pull/92.patch"
	"${url}/pull/96.patch"
	"https://salsa.debian.org/debian/${pkgname}/-/raw/master/debian/patches/gcc-14.patch")
makedepends=('gcc-objc' 're2c' 'doxygen')
sha256sums=('81f600cdc88adb2258f57df1ed2d87f0afa945f66cbf8897ad50e76f42509168'
            '0d79951a8aaffc1588fdb5717f122dc79bb6ab107986b6d54e8a681754beaea9'
            '51f9641afd9348eb06dfdae10073d43f2bb63358e4b8570caaf03c8a1b50ed44'
            '29fe8fdae6d503a28befb4f97086d7779599471101da829d9e177bd75f5f12f9'
            '003e5acefebc5cdbea5a9513ca8a27f624917a357e72f825dccf4294c375b4f5'
            '6e076fd2f6b417e7282a5b885330a42b8a41cc4c0622801c75a9fc109b156c1f'
            'dc6c47c743b8222ac412ee03ebfefa42363cfaade17f0184717347bf9fb61466'
            'efe1a990a8ce3b11c781d5f54f47ae51a5be1f6840d90b3a4837f0baf701492a'
            '75f5d5cfcb715acebf17d0a9610aae9920ff9f7e159e4c2dc9139be4351a27e3')
backup=("etc/openvpn/server/${_name}.conf")

prepare() {
  cd "${pkgname}-${_name}-${pkgver}"
  for e in "../"*".patch"
    do
    echo "Apply patch: ${e}"
    patch -p1 -i "../${e}"
  done

  # Archlinux use gcc
  sed -i \
    -e 's|AC_CONFIG_SRCDIR(${srcdir}/src/auth-ldap.m)|AC_CONFIG_SRCDIR(src/auth-ldap.m)|g' \
    -e 's|C_PROG_CC(clang gobjc gcc)|C_PROG_CC(gcc)|g' \
    -e 's|AC_PROG_OBJC(clang gobjc gcc)|AC_PROG_OBJC(gcc)|g' \
    configure.ac

  autoreconf -fvi
  autoheader

  CFLAGS="${CFLAGS} -std=gnu99" \
  ./configure \
    --with-openvpn="/usr/include" \
    --with-openldap="/usr/include" \
    --with-openssl="/usr/include" \
    --with-objc-runtime="GNU"
}

build() {
  cd "${pkgname}-${_name}-${pkgver}"
  make
}

check() {
  cd "${pkgname}-${_name}-${pkgver}"
  make test
}

package() {
  cd "${pkgname}-${_name}-${pkgver}"
  install -Dm0775 "src/${pkgname}.so" "${pkgdir}/usr/lib/openvpn/plugins/${pkgname}.so"
  install -Dm0400 "${_name}.conf" "${pkgdir}/etc/openvpn/server/${_name}.conf"
}
