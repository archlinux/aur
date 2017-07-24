# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=openvpn
pkgver=2.4.3
pkgrel=3
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network)'
arch=('i686' 'x86_64')
url='http://openvpn.net/index.php/open-source.html'
depends=('openssl' 'lzo' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('systemd')
license=('custom')
validpgpkeys=('F554A3687412CFFEBDEFE0A312F5F7B42F2B01E7') # OpenVPN - Security Mailing List <security@openvpn.net>
#source=("https://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.xz"{,.asc})
source=("http://www.eurephia.net/openvpn/openvpn-${pkgver}.tar.xz"
        "openvpn-${pkgver}.tar.xz.asc"
        '0001-set-tls-cipher-restriction-before-loading-certificates.patch'
        '0002-management-preserve-wait_for_push-field-when-asking-for-user_pass.patch')
sha256sums=('7aa86167a5b8923e54e8795b814ed77288c793671f59fd830d9ab76d4b480571'
            'SKIP'
            'd23b4b7642450eab01873c9dbc95c851324f9726f5706541fffde7551818ebb9'
            'e4b95b766b5e0c4db3e7f67dcc5bba1e63e259861ef4b28244c180a88e1d643a')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # Set tls-cipher restriction before loading certificates
  patch -Np1 < "${srcdir}"/0001-set-tls-cipher-restriction-before-loading-certificates.patch

  # management: preserve wait_for_push field when asking for user/pass
  patch -Np1 < "${srcdir}"/0002-management-preserve-wait_for_push-field-when-asking-for-user_pass.patch

  # regenerate configure script
  autoreconf -fi
}

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

