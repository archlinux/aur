# Maintainer: Chris Lea <chris.lea@gmail.com>
# Contributer: Christian Hesse <mail@eworm.de>

pkgname=openvpn-mbedtls
_tag='4664c458f154156e5d56020bedefc160fdc79465' # git rev-parse v${pkgver}
_pkgname=openvpn
crypto_library=mbedtls
pkgver=2.6.3
pkgrel=1
pkgdesc="An easy-to-use, robust and highly configurable VPN (Virtual Private Network), linked against the ${crypto_library} library for crypto support."
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openvpn.net/index.php/open-source.html'
depends=('lzo' 'lz4' 'iproute2' 'systemd-libs' "${crypto_library}")
optdepends=('easy-rsa: easy CA and certificate handling'
            'pam: authenticate via PAM')
makedepends=('git' 'systemd' 'cmocka' 'python-docutils')
install=openvpn.install
validpgpkeys=('F554A3687412CFFEBDEFE0A312F5F7B42F2B01E7'  # OpenVPN - Security Mailing List <security@openvpn.net>
              'B62E6A2B4E56570B7BDC6BE01D829EFECA562812') # Gert Doering <gert@v6.de>
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
license=('custom')
source=("git+https://github.com/OpenVPN/openvpn.git#tag=${_tag}?signed"
        '0001-unprivileged.patch'
        'sysusers.conf'
        'tmpfiles.conf')
sha256sums=('SKIP'
            '77874824d96c1fd6c14259a6ea16232ae574dda3d5adba1798ccd6c93694846c'
            '3646b865ac67783fafc6652589cfe2a3105ecef06f3907f33de5135815f6a621'
            'b1436f953a4f1be7083711d11928a9924993f940ff56ff92d288d6100df673fc')

prepare() {
  cd "${srcdir}"/${_pkgname}

  # https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg19302.html
  sed -i '/^CONFIGURE_DEFINES=/s/set/env/g' configure.ac

  # start with unprivileged user and keep granted privileges
  patch -Np1 < ../0001-unprivileged.patch

  autoreconf --force --install
}

build() {
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build

  "${srcdir}"/openvpn/configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --with-crypto-library=${crypto_library} \
    --enable-iproute2 \
    --enable-plugins \
    --enable-systemd
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
  install -D -m0644 ../sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/openvpn.conf
  install -D -m0644 ../tmpfiles.conf "${pkgdir}"/usr/lib/tmpfiles.d/openvpn.conf

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
