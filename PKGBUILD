# Maintainer: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org> ([core] package)

_pkgname=openvpn
pkgname=$_pkgname-x509-alt-username
pkgver=2.3.10
pkgrel=1
pkgdesc="OpenVPN with x509-username-field option enabled"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo' 'iproute2' 'libsystemd')
makedepends=('systemd')
conflicts=('openvpn')
provides=('openvpn')
license=('custom')
install=openvpn.install
source=(http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz
        openvpn@.service)
sha256sums=('f8b0b5b92e35bbca1db1a7e6b49e04639e45634e9accd460459b40b2c99ec8f6'
            '860976d954bd1db95861b95f0ef42e4e80618aa23a9f2aed26d17ee3d09110df')

build() {
  cd "${srcdir}"/$_pkgname-$pkgver
  CFLAGS="$CFLAGS -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-password-save \
    --mandir=/usr/share/man \
    --enable-iproute2 \
    --enable-systemd \
    --enable-x509-alt-username
  make
}

package() {
  cd "${srcdir}"/$_pkgname-$pkgver
  # Install openvpn
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}"/etc/openvpn
  # Install examples
  install -d -m755 "${pkgdir}"/usr/share/openvpn
  cp -r sample/sample-config-files "${pkgdir}"/usr/share/openvpn/examples
  # Install license
  install -d -m755 "${pkgdir}"/usr/share/licenses/${_pkgname}/
  ln -sf /usr/share/doc/${_pkgname}/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/${_pkgname}/
  # Install contrib
  install -d -m755 "${pkgdir}"/usr/share/openvpn/contrib
  cp -r contrib "${pkgdir}"/usr/share/openvpn
  # Install systemd service
  install -D -m644 "${srcdir}"/openvpn@.service "${pkgdir}"/usr/lib/systemd/system/openvpn@.service
}
