# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=openvpn
pkgver=2.3.5
pkgrel=1
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo' 'iproute2' 'libsystemd')
makedepends=('systemd')
license=('custom')
install=openvpn.install
source=(http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz
        http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz.asc
        openvpn@.service)
sha256sums=('d93b447b014a41ec1550c3b760871aa72d7c09f1b5c6fc1e013d3073ac29ca21'
            'SKIP'
            '860976d954bd1db95861b95f0ef42e4e80618aa23a9f2aed26d17ee3d09110df')

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
