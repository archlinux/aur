# Maintainer: Alexandria Pettit <alxpettit@gmail.com>
# Contributer: Christian Hesse <mail@eworm.de>

pkgname=openvpn-rrf
pkgver=2.4.8
pkgrel=1
pkgdesc='OpenVPN with my "Recursive Routing Fix" patch installed.'
arch=('x86_64')
url='http://openvpn.net/index.php/open-source.html'
depends=('openssl' 'lzo' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('systemd' 'patch')
provides=('openvpn')
license=('custom')
conflicts=('openvpn')
validpgpkeys=('F554A3687412CFFEBDEFE0A312F5F7B42F2B01E7') # OpenVPN - Security Mailing List <security@openvpn.net>
source=("https://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz"{,.asc} "recursive-routing-fix.patch")
sha256sums=('65e1da3f3a08e7e900c175e7fc30d834881fd2dea0eb39b25325a861a9da0bc5'
            'SKIP'
            '1570ac6306de32958e7e3c6a69517a4b1fc80135201534890a66e75e780e4dd5')

prepare() {
  cd "${srcdir}"/openvpn-${pkgver}
  patch -p1 -i ../recursive-routing-fix.patch 
}

build() {
  cd "${srcdir}"/openvpn-${pkgver}

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
  cd "${srcdir}"/openvpn-${pkgver}

  make
}

package() {
  cd "${srcdir}"/openvpn-${pkgver}

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

