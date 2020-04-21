# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=openvpn-openssl-1.0
_pkgname=openvpn
pkgver=2.4.9
pkgrel=2
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network) (build against openssl-1.0)'
arch=('i686' 'x86_64')
url='https://openvpn.net/index.php/open-source.html'
depends=('openssl-1.0' 'lzo' 'iproute2' 'systemd-libs' 'pkcs11-helper')
conflicts=('openvpn')
provides=('openvpn')
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('git' 'systemd')
license=('custom')
source=("git+https://github.com/OpenVPN/openvpn.git#tag=v${pkgver}")
sha256sums=('SKIP')

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

  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig

  CONFIG_SHELL=/bin/bash "${srcdir}"/${_pkgname}/configure \
    CONFIG_SHELL=/bin/bash \
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
}

# vim: ts=2 sw=2 et:
