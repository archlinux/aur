# Maintainer: s3rj1k <evasive.gyron@gmail.com>

pkgname=openvpn-resolv-conf
_pkgname=openvpn
pkgver=2.4.9
pkgrel=2
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network)'
arch=('x86_64')
url='https://openvpn.net/index.php/open-source.html'
depends=('openssl' 'lzo' 'iproute2' 'systemd-libs' 'pkcs11-helper')
conflicts=('openvpn')
provides=('openvpn')
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('git' 'systemd')
license=('custom')
validpgpkeys=('F554A3687412CFFEBDEFE0A312F5F7B42F2B01E7'  # OpenVPN - Security Mailing List <security@openvpn.net>
              'B62E6A2B4E56570B7BDC6BE01D829EFECA562812') # Gert Doering <gert@v6.de>
source=("git+https://github.com/OpenVPN/openvpn.git#tag=v${pkgver}?signed")
sha256sums=('SKIP')
source+=('https://raw.githubusercontent.com/masterkorp/openvpn-update-resolv-conf/master/update-resolv-conf.sh')
sha256sums+=('e6da6b3e8025f4fb0b4c3ce04f782f33833fbfdf43623a3963f80c41fecd1408')

prepare() {
  cd "${srcdir}"/${_pkgname}

  autoreconf --force --install
}

build() {
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build

  # for reproducibility we force bash for build system:
  # https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg19302.html
  # https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Defining-Variables.html

  CONFIG_SHELL=/bin/bash "${srcdir}"/${_pkgname}/configure \
    CONFIG_SHELL=/bin/bash \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-iproute2 \
    --enable-pkcs11 \
    --enable-plugins \
    --enable-systemd \
    --enable-password-save \
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

  # Create empty configuration directories
  install -d -m0750 -g 90 "${pkgdir}"/etc/openvpn/{client,server}

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
      "text/x-shellscript") install -D -m0755 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
      *) install -D -m0644 "${FILE}" "${pkgdir}/usr/share/openvpn/${FILE}" ;;
    esac
  done

  # Install update-resolv-conf script
  cp --no-preserve=ownership "$srcdir/update-resolv-conf.sh" "$pkgdir/etc/openvpn/update-resolv-conf"
  chmod +x "$pkgdir/etc/openvpn/update-resolv-conf"
}
