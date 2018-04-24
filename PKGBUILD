# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=openvpn
pkgver=2.4.6
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network)'
arch=('x86_64')
url='http://openvpn.net/index.php/open-source.html'
depends=('openssl' 'lzo' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('systemd')
license=('custom')
validpgpkeys=('F554A3687412CFFEBDEFE0A312F5F7B42F2B01E7') # OpenVPN - Security Mailing List <security@openvpn.net>
source=("https://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz"{,.asc})
sha256sums=('738dbd37fcf8eb9382c53628db22258c41ba9550165519d9200e8bebaef4cbe2'
            'SKIP')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-iproute2 \
    --enable-pkcs11 \
    --enable-plugins \
    --enable-systemd \
    --enable-x509-alt-username
  make
}

check() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make check
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # Install openvpn
  make DESTDIR="${pkgdir}" install

  # Create empty configuration directories
  install -d -m0750 -g 90 "${pkgdir}"/etc/openvpn/{client,server}

  # Install examples
  install -d -m0755 "${pkgdir}"/usr/share/openvpn
  cp -r sample/sample-config-files "${pkgdir}"/usr/share/openvpn/examples

  # Install license
  install -d -m0755 "${pkgdir}"/usr/share/licenses/openvpn/
  ln -sf /usr/share/doc/openvpn/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/openvpn/

  # Install contrib
  for FILE in $(find contrib -type f); do
    case "$(file --brief --mime-type "${FILE}")" in
      "text/x-shellscript") install -D -m0755 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
      *) install -D -m0644 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
    esac
  done
}

