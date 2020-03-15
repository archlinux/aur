# $Id$
# Maintainer: s3rj1k <evasive.gyron@gmail.com>
# Contributor: Stanislaw Datskevich <me a nek0 net>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=openvpn-pkcs11
_pkgname=openvpn
pkgver=2.4.8
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network)'
arch=('x86_64')
url='http://openvpn.net/index.php/open-source.html'
depends=('openssl' 'lzo' 'iproute2' 'pkcs11-helper')
conflicts=('openvpn')
provides=('openvpn')
optdepends=('easy-rsa: easy CA and certificate handling')
license=('custom')
source=("https://swupdate.openvpn.net/community/releases/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('fb8ca66bb7807fff595fbdf2a0afd085c02a6aa47715c9aa3171002f9f1a3f91')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-iproute2 \
    --enable-pkcs11 \
    --enable-plugins \
    --enable-password-save \
    --enable-x509-alt-username
  make
}

check() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  make check
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  # Install ${_pkgname}
  make DESTDIR="${pkgdir}" install

  # Create empty configuration directories
  install -d -m0750 -g 90 "${pkgdir}"/etc/${_pkgname}/{client,server}

  # Install examples
  install -d -m0755 "${pkgdir}"/usr/share/${_pkgname}
  cp -r sample/sample-config-files "${pkgdir}"/usr/share/${_pkgname}/examples

  # Install license
  install -d -m0755 "${pkgdir}"/usr/share/licenses/${_pkgname}/
  ln -sf /usr/share/doc/${_pkgname}/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/${_pkgname}/

  # Install contrib
  for FILE in $(find contrib -type f); do
    case "$(file --brief --mime-type "${FILE}")" in
      "text/x-shellscript") install -D -m0755 "${FILE}" "${pkgdir}/usr/share/${_pkgname}/${FILE}" ;;
      *) install -D -m0644 "${FILE}" "${pkgdir}/usr/share/${_pkgname}/${FILE}" ;;
    esac
  done
}
