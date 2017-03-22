# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=openvpn
pkgver=2.4.1
pkgrel=1
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network)'
arch=('i686' 'x86_64')
url='http://openvpn.net/index.php/open-source.html'
depends=('openssl' 'lzo' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa: easy CA and certificate handling')
makedepends=('systemd')
license=('custom')
install=openvpn.install
validpgpkeys=('6D04F8F1B0173111F499795E29584D9F40864578'  # Samuli Seppänen <samuli@openvpn.net>
              '7ACD56B74144925C6214329757DB9DAB613B8DA1') # David Sommerseth (OpenVPN Technologies, Inc) <davids@openvpn.net>
source=("https://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.xz"{,.asc}
        '0004-openssl-1-1-0.patch')
sha256sums=('fde9e22c6df7a335d2d58c6a4d5967be76df173c766a5c51ece57fd044c76ee5'
            'SKIP'
            'd801b1118d64c0667eae87ab1da920179f339614da22c5c8bed75d17650fad03')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # allow to build against openssl 1.1.0
  patch -Np1 < "${srcdir}"/0004-openssl-1-1-0.patch

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

