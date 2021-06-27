# Maintainer: Chris Lea <chris.lea@gmail.com>
# Contributer: Christian Hesse <mail@eworm.de>

pkgname=openvpn-mbedtls
_pkgname=openvpn
crypto_library=mbedtls
pkgver=2.5.3
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network), linked against the mbedtls library for crypto support.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openvpn.net/index.php/open-source.html'
depends=('lzo' 'iproute2' 'systemd-libs' "${crypto_library}")
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('git' 'systemd' 'cmocka')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
license=('custom')
source=("https://swupdate.openvpn.org/community/releases/${_pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=("fb6a9943c603a1951ca13e9267653f8dd650c02f84bccd2b9d20f06a4c9c9a7e"
            "SKIP")
validpgpkeys=('F554A3687412CFFEBDEFE0A312F5F7B42F2B01E7')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  CONFIG_SHELL=/bin/bash "${srcdir}"/${_pkgname}-${pkgver}/configure \
    CONFIG_SHELL=/bin/bash \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-iproute2 \
    --with-crypto-library=${crypto_library} \
    --enable-plugins \
    --enable-systemd
  make
}

check() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make check
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  # Install openvpn
  make DESTDIR="${pkgdir}" install

  # Create empty configuration directories
  install -d -m0750 -g 90 "${pkgdir}"/etc/openvpn/{client,server}

  # Install license
  install -d -m0755 "${pkgdir}"/usr/share/licenses/openvpn/
  ln -sf /usr/share/doc/openvpn/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/openvpn/

  cd "${srcdir}"/${_pkgname}-${pkgver}

  # Install examples
  install -d -m0755 "${pkgdir}"/usr/share/openvpn
  cp -r sample/sample-config-files "${pkgdir}"/usr/share/openvpn/examples

  # Install contrib
  for FILE in $(find contrib -type f); do
    case "$(file --brief --mime-type --no-sandbox "${FILE}")" in
      "text/x-shellscript") install -D -m0755 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
      *) install -D -m0644 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
    esac
  done
}
