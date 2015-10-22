# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=openvpn
pkgver=2.3.8
pkgrel=2
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo' 'iproute2' 'libsystemd')
makedepends=('systemd')
license=('custom')
install=openvpn.install
source=(http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz
        http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz.asc
		0001-Fix-systemd-errors-when-openvpn-is-started-when-ther.patch
        openvpn@.service)
sha256sums=('532435eff61c14b44a583f27b72f93e7864e96c95fe51134ec0ad4b1b1107c51'
            'SKIP'
            'a03a22de7cb3bd9ece7ccb041283d4bd17eb898a9e3fe76d0fd1e20fb80a59f3'
            '860976d954bd1db95861b95f0ef42e4e80618aa23a9f2aed26d17ee3d09110df')
validpgpkeys=('03300E11FED16F59715F9996C29D97ED198D22A3')  # Samuli Seppänen

prepare() {
	patch -p 1 -d $pkgname-$pkgver < 0001-Fix-systemd-errors-when-openvpn-is-started-when-ther.patch
}

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
