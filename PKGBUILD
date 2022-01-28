# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='openvpn-otp'
pkgver='1.0'
pkgrel='4'
pkgdesc='This plugin adds support for TOTP and HOTP tokens (like Google Authenticator) for OpenVPN'
arch=('any')
url="https://github.com/evgeny-gridasov/${pkgname}"
license=('GPL')
depends=('openvpn')
source=("${url}/archive/v${pkgver}.tar.gz"
	"${url}/pull/35.patch"
	"${url}/pull/41.patch")
makedepends=('openssl')
md5sums=('3ff2b8f9cc054ccac31f99e9ee704f67'
         'b199454e79e9c9cb962cbde9626429a0'
         '0a90d12752229ac283c9adb975ca9eac')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/35.patch"
  patch -p1 -i "${srcdir}/41.patch"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --with-openvpn-plugin-dir="/usr/lib/openvpn/plugins"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib/openvpn/plugins"
}
