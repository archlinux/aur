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
        '0001-Clean-up-plugin-path-handling.patch'
        '0002-do-not-race-on-RuntimeDirectory.patch'
        '0003-systemd-Move-the-READY-1-signalling-to-an-earlier-po.patch'
        '0004-openssl-1-1-0.patch')
sha256sums=('6f23ba49a1dbeb658f49c7ae17d9ea979de6d92c7357de3d55cd4525e1b2f87e'
            'SKIP'
            '162a21f78fc83071643341fb4198092d7d81b8196573d53ce43548424d757be2'
            '58ee9d2f4d8a74c3dec037265b84963171f76f9fb6689a529728cdc76fac30dd'
            'ae8fd591c05c04ad4b500494c55df242f3a2309f2af579b45820ce9959f1df06'
            '89df81500b1891fbc7797723ee6e54f82e656059f6238884591113ed00e679db')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # Clean up plugin path handling
  patch -Np1 < "${srcdir}"/0001-Clean-up-plugin-path-handling.patch

  # do not race on RuntimeDirectory
  patch -Np1 < "${srcdir}"/0002-do-not-race-on-RuntimeDirectory.patch

  # systemd: Move the READY=1 signalling to an earlier point
  patch -Np1 < "${srcdir}"/0003-systemd-Move-the-READY-1-signalling-to-an-earlier-po.patch

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

