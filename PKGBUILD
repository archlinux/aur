# Maintainer: Enihcam <gmail n a n e r i c w a n g>

pkgname=fingerprint-qt5
_pkgname=fingerprint-gui
pkgver=1.09
pkgrel=1
pkgdesc="Qt5 application for fingerprint-based authentication, automatically support UPEK fingerprint readers with non-free library"
arch=('x86_64')
url="http://www.ullrich-online.cc/fingerprint/"
license=('GPL')
conflicts=("${_pkgname}")
depends=('libfprint' 'libfakekey' 'polkit-qt5' 'qca-qt5' 'qt5-x11extras')
optdepends=('libusb: for libbsapi')
source=("https://github.com/maksbotan/${_pkgname}/archive/v${pkgver}-qt5.tar.gz"
        "${_pkgname}-udev-path.patch"
        "${_pkgname}-udev-0050.patch")
install="${pkgname}.install"
sha512sums=('c4fb22368d82d72586f80009b5adb9db0a8e8777c3d1c1f23cf58a21f718a3e3d05bbc90fff295be969cf7f744f037fb886e975e626cf6d599f8f6b5f8323724'
            'a815d5713ae7542efbed560a3f711dec0b0a9e7072873efa7563b695d136d6a0e50bb8e81eaa7d3b4a732a54090ce113d292dd3531deda6c3dbda76094888719'
            'd3dcc7377e7505332080a6dfa6d127851d8d5f541a67a0f5b7f2b42918e76dd223dfef6ad5cb3d3502050dcbac8a2cf58ddcdc18dc0e0df60c81b70f1b0003b3')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}-qt5"
  patch -p1 -i "${srcdir}/${_pkgname}-udev-path.patch"
  patch -p1 -i "${srcdir}/${_pkgname}-udev-0050.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-qt5"
  qmake-qt5 QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" PREFIX=/usr LIB=/usr/lib
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-qt5"
  make INSTALL_ROOT="${pkgdir}/" install
  make INSTALL_ROOT="${pkgdir}/" upek-rules
  make INSTALL_ROOT="${pkgdir}/" upek-cfg

  # upstream build rule wanna create group/change rights as well
  install -dm770 "${pkgdir}/var/upek_data"

  install -Dm644 upek/lib64/libbsapi.so.* "${pkgdir}/usr/lib/"
  install -Dm644 "CHANGELOG" "COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/"
}
