# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=openvpn
pkgver=2.4.0
pkgrel=2
pkgdesc='An easy-to-use, robust and highly configurable VPN (Virtual Private Network)'
arch=('i686' 'x86_64')
url='http://openvpn.net/index.php/open-source.html'
depends=('openssl' 'lzo' 'iproute2' 'libsystemd' 'pkcs11-helper')
optdepends=('easy-rsa: easy CA and certificate handling')
makedepends=('systemd')
license=('custom')
install=openvpn.install
validpgpkeys=('03300E11FED16F59715F9996C29D97ED198D22A3'  # Samuli Seppänen <samuli.seppanen@gmail.com>
              '7ACD56B74144925C6214329757DB9DAB613B8DA1') # David Sommerseth (OpenVPN Technologies, Inc) <davids@openvpn.net>
source=("https://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.xz"{,.asc}
        '0001-plugin.patch'
        '0002-do-not-race-on-RuntimeDirectory.patch'
        '0003-fix-timeout-in-non-TLS-mode-with-systemd.patch')
sha256sums=('6f23ba49a1dbeb658f49c7ae17d9ea979de6d92c7357de3d55cd4525e1b2f87e'
            'SKIP'
            'b8254067b4ef5d157d87267a76938d86f101972303c7ff20131cc9f28659a30c'
            'a87b081f998db99190e8b9e185cd7aade5bd6dfb5c03777c82b75d28cd3b375c'
            '1b0ff78390dd5e79ce6966fd7fee54d42f6f3622cf8078d8b0f9998046e6b73b')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # plugin path
  patch -Np1 < "${srcdir}"/0001-plugin.patch

  # do not race on RuntimeDirectory
  patch -Np1 < "${srcdir}"/0002-do-not-race-on-RuntimeDirectory.patch

  # fix timeout in non-TLS mode with systemd
  patch -Np1 < "${srcdir}"/0003-fix-timeout-in-non-TLS-mode-with-systemd.patch

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

  # Install systemd files
  install -d -m0755 "${pkgdir}"/usr/lib/systemd/system/
  install -m0644 distro/systemd/openvpn-{client,server}@.service "${pkgdir}"/usr/lib/systemd/system/
  install -D -m0644 distro/systemd/openvpn.conf "${pkgdir}"/usr/lib/tmpfiles.d/openvpn.conf
  install -d -m0710 "${pkgdir}"/run/openvpn-{client,server}
}

