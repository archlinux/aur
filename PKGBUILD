# Maintainer: Stanislaw Datskevich <me a nek0 net>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=openvpn-pkcs11
pkgver=2.3.7
pkgrel=2
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network) with smartcard support"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo' 'iproute2' 'pkcs11-helper')
license=('custom')
install=openvpn.install
source=(http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz)
sha256sums=('1f02a4cd6aeb6250ca9311560875b10ce8957a3c9101a8005bd1e17e5b03146e')

build() {
  cd "${srcdir}"/openvpn-$pkgver
  CFLAGS="$CFLAGS -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-password-save \
    --mandir=/usr/share/man \
    --enable-iproute2 \
    --enable-pkcs11
  make
}

package() {
  cd "${srcdir}"/openvpn-$pkgver
  # Install openvpn
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}"/etc/openvpn
  # Install examples
  install -d -m755 "${pkgdir}"/usr/share/openvpn
  cp -r sample/sample-config-files "${pkgdir}"/usr/share/openvpn/examples
  # Install license
  install -d -m755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  ln -sf /usr/share/doc/${pkgname}/{COPYING,COPYRIGHT.GPL} "${pkgdir}"/usr/share/licenses/${pkgname}/
  # Install contrib
  install -d -m755 "${pkgdir}"/usr/share/openvpn/contrib
  cp -r contrib "${pkgdir}"/usr/share/openvpn
}

