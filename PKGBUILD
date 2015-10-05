# Maintainer: Tad Fisher <tadfisher@gmail.com>

pkgname=openvpn-sdnotify
_pkgname=openvpn
pkgver=2.3.8
pkgrel=1
pkgdesc="OpenVPN with systemd sd_notify support"
arch=(i686 x86_64)
url="http://openvpn.net/index.php/open-source.html"
depends=('openssl' 'lzo' 'iproute2' 'libsystemd')
makedepends=('systemd')
conflicts=('openvpn')
provides=("openvpn=${pkgver}")
license=('custom')
install=openvpn.install
source=(http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz
        http://swupdate.openvpn.net/community/releases/openvpn-${pkgver}.tar.gz.asc
        openvpn@.service
        systemd-notify.patch)
sha256sums=('532435eff61c14b44a583f27b72f93e7864e96c95fe51134ec0ad4b1b1107c51'
            'SKIP'
            '5231dd10444b6c24309fa70db441252cad3a84a39231b122c182cb0fdc61ae70'
            '81b3ce649cd2a966be2d1a93278b0881cabefce13f2e355b175613a313dfa835')

prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver
  patch -p1 < "${srcdir}"/systemd-notify.patch
}

build() {
  cd "${srcdir}"/$_pkgname-$pkgver
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
