# Maintainer: Chris Lea <chris.lea@gmail.com>
# Contributer: Christian Hesse <mail@eworm.de>

pkgname=openvpn-mbedtls
_pkgname=openvpn
crypto_library=mbedtls
pkgver=2.7.4
pkgrel=1
pkgdesc="An easy-to-use, robust and highly configurable VPN (Virtual Private Network), linked against the ${crypto_library} library for crypto support."
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openvpn.net/index.php/open-source.html'
depends=('libcap-ng' 'libcap-ng.so'
         'libnl' 'libnl-genl-3.so' 'libnl-3.so'
         'lz4'
         'lzo' 'liblzo2.so'
         'systemd-libs' 'libsystemd.so'
         "${crypto_library}")
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('git' 'systemd' 'cmocka' 'python-docutils')
install=openvpn.install
validpgpkeys=('F554A3687412CFFEBDEFE0A312F5F7B42F2B01E7'  # OpenVPN - Security Mailing List <security@openvpn.net>
              'B62E6A2B4E56570B7BDC6BE01D829EFECA562812') # Gert Doering <gert@v6.de>
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
license=('custom')
source=("git+https://github.com/OpenVPN/openvpn.git#tag=v${pkgver}?signed"
        'openvpn.sysusers'
        'openvpn.tmpfiles')
sha256sums=('920230606151c0fe23597b487bc886516dc53a9b70c95b936c3a6024c6e64e01'
            '15669f82ac8b412eb3840ba9b39de20ca9b04bf082516c229577a5cb4e1a9610'
            'b1436f953a4f1be7083711d11928a9924993f940ff56ff92d288d6100df673fc')

prepare() {
  cd "${srcdir}"/${_pkgname}

  autoreconf --force --install
}

build() {
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build

  "${srcdir}"/openvpn/configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --with-crypto-library=${crypto_library} \
    --enable-dco \
    --enable-plugins \
    --enable-systemd \
    --enable-x509-alt-username
  make
}

check() {
  cd "${srcdir}"/build

  make check
}

package() {
  cd "${srcdir}"/build

  # Install openvpn
  make DESTDIR="${pkgdir}" install

  # Install sysusers and tmpfiles files
  install -D -m0644 ../openvpn.sysusers "${pkgdir}"/usr/lib/sysusers.d/openvpn.conf
  install -D -m0644 ../openvpn.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/openvpn.conf

  # Install license
  install -d -m0755 "${pkgdir}"/usr/share/licenses/openvpn/
  ln -sf /usr/share/doc/openvpn/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/openvpn/

  cd "${srcdir}"/${_pkgname}

  # Install examples
  install -d -m0755 "${pkgdir}"/usr/share/openvpn
  cp -r sample/sample-config-files "${pkgdir}"/usr/share/openvpn/examples

  # Install contrib
  for FILE in $(find contrib -type f); do
    case "$(file --brief --mime-type --no-sandbox "${FILE}")" in
      "text/x-shellscript")
        install -D -m0755 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
      *)
        install -D -m0644 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
    esac
  done
}
