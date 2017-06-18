# $Id$
# Maintainer: s3rj1k <evasive.gyron@gmail.com>
# Contributor: Stanislaw Datskevich <me a nek0 net>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=openvpn-pkcs11
_pkgname=openvpn
pkgver=2.4.2
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network)'
arch=('i686' 'x86_64')
url='http://openvpn.net/index.php/open-source.html'
depends=('openssl' 'lzo' 'iproute2' 'pkcs11-helper' 'pam')
conflicts=('openvpn')
provides=('openvpn')
optdepends=('easy-rsa: easy CA and certificate handling')
license=('custom')
source=("https://swupdate.openvpn.net/community/releases/${_pkgname}-${pkgver}.tar.xz"
        '0004-openssl-1-1-0.patch')
sha256sums=('df5c4f384b7df6b08a2f6fa8a84b9fd382baf59c2cef1836f82e2a7f62f1bff9'
            'd801b1118d64c0667eae87ab1da920179f339614da22c5c8bed75d17650fad03')

prepare() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  # allow to build against openssl 1.1.0
  patch -Np1 < "${srcdir}"/0004-openssl-1-1-0.patch

  # regenerate configure script
  autoreconf -fi
}

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

