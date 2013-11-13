# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=openvpn
pkgver=2.3.2
pkgrel=2
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo2' 'iproute2')
makedepends=('systemd')
license=('custom')
install=openvpn.install
source=(http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz
        http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz.asc
        openvpn@.service)
md5sums=('06e5f93dbf13f2c19647ca15ffc23ac1'
         'SKIP'
         '71fab8d1c2aa3a1f2609e259eaaf88b3')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  CFLAGS="$CFLAGS -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-password-save \
    --mandir=/usr/share/man \
    --enable-iproute2 \
    --enable-systemd
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
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
  # Install systemd service
  install -D -m644 "${srcdir}"/openvpn@.service "${pkgdir}"/usr/lib/systemd/system/openvpn@.service
}
