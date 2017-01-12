# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Feifei Jia <feifei.j at gmail dot com>

pkgname=fingerprint-gui
pkgver=1.09
pkgrel=3
pkgdesc="Application for fingerprint-based authentication, automatically support UPEK fingerprint readers with non-free library"
arch=('i686' 'x86_64')
url="http://www.ullrich-online.cc/fingerprint/"
license=('GPL')
depends=('libfprint' 'libfakekey' 'polkit-qt4' 'qca')
optdepends=('libusb: for libbsapi')
source=("http://www.ullrich-online.cc/fingerprint/download/${pkgname}-${pkgver}.tar.gz"
        "fingerprint-gui-udev-path.patch"
        "fingerprint-gui-udev-0050.patch")
install="${pkgname}.install"
md5sums=('699fbdb53d652cabd3c5fdd91078da58'
         '603612909a3d8b06d5ce4d59ebde4944'
         '244a769249f2b25b8613798fc063f494')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/fingerprint-gui-udev-path.patch"
  patch -p1 -i "${srcdir}/fingerprint-gui-udev-0050.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt4 PREFIX=/usr LIB=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
  make INSTALL_ROOT="${pkgdir}/" upek-rules
  make INSTALL_ROOT="${pkgdir}/" upek-cfg

  # upstream build rule wanna create group/change rights as well
  install -dm770 "${pkgdir}/var/upek_data"
  # we are using custom rule to define arch by using our mechanisms
  # (e.g. crossplatform build)
  if [[ ${CARCH} == "i686" ]]; then
    install -Dm644 upek/lib/libbsapi.so.* "${pkgdir}/usr/lib/"
  else
    install -Dm644 upek/lib64/libbsapi.so.* "${pkgdir}/usr/lib/"
  fi

  install -Dm644 "CHANGELOG" "COPYING" "${pkgdir}/usr/share/doc/${pkgname}/"
}
