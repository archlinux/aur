# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Feifei Jia <feifei.j at gmail dot com>
# Contributor: Enihcam <gmail n a n e r i c w a n g>

pkgname=fingerprint-gui
pkgver=1.09
pkgrel=5
pkgdesc="Application for fingerprint-based authentication, automatically support UPEK fingerprint readers with non-free library"
arch=('i686' 'x86_64')
url="http://www.ullrich-online.cc/fingerprint/"
license=('GPL')
depends=('libfprint' 'libfakekey' 'polkit-qt5' 'qca-qt5' 'qt5-x11extras')
optdepends=('libusb: for libbsapi')
source=("https://github.com/maksbotan/${pkgname}/archive/v${pkgver}-qt5.tar.gz"
        "fingerprint-gui-udev-path.patch"
        "fingerprint-gui-udev-0050.patch")
install="${pkgname}.install"
sha512sums=('c4fb22368d82d72586f80009b5adb9db0a8e8777c3d1c1f23cf58a21f718a3e3d05bbc90fff295be969cf7f744f037fb886e975e626cf6d599f8f6b5f8323724'
            'a815d5713ae7542efbed560a3f711dec0b0a9e7072873efa7563b695d136d6a0e50bb8e81eaa7d3b4a732a54090ce113d292dd3531deda6c3dbda76094888719'
            'd3dcc7377e7505332080a6dfa6d127851d8d5f541a67a0f5b7f2b42918e76dd223dfef6ad5cb3d3502050dcbac8a2cf58ddcdc18dc0e0df60c81b70f1b0003b3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-qt5"
  patch -p1 -i "${srcdir}/fingerprint-gui-udev-path.patch"
  patch -p1 -i "${srcdir}/fingerprint-gui-udev-0050.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-qt5"
  qmake PREFIX=/usr LIB=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-qt5"
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

