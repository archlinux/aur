# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Feifei Jia <feifei.j at gmail dot com>

pkgname=fingerprint-gui
pkgver=1.07
pkgrel=2
pkgdesc="Application for fingerprint-based authentication, automatically support UPEK fingerprint readers with non-free library"
arch=('i686' 'x86_64')
url="http://www.ullrich-online.cc/fingerprint/"
license=('GPL')
depends=('libfprint' 'libfakekey' 'polkit-qt4' 'qca')
optdepends=('libusb: for libbsapi')
source=("http://ullrich-online.cc/nview/Appliance/fingerprint/download/${pkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
md5sums=('a909b2fb386abc9259aac727e8ad97c8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt4 PREFIX=/usr LIB=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
  install -Dm644 "CHANGELOG" "COPYING" "${pkgdir}/usr/share/doc/${pkgname}/"

  install -dm770 "${pkgdir}/var/upek_data"
  install -Dm644 "upek/upek.cfg" "${pkgdir}/etc/"
  install -Dm644 "upek/91-fingerprint-gui-upek.rules" "${pkgdir}/etc/udev/rules.d/"
  if [[ CARCH == "i686" ]]; then
    install -Dm644 upek/lib/libbsapi.so.* "${pkgdir}/usr/lib/"
  else
    install -Dm644 upek/lib64/libbsapi.so.* "${pkgdir}/usr/lib/"
  fi
}
