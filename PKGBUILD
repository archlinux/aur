# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Feifei Jia <feifei.j at gmail dot com>

pkgname=fingerprint-gui
pkgver=1.09
pkgrel=4
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
sha512sums=('7ee1c0774d0f7871ec6be00a813b8a273a8e02bd6a285dd2a695c330920da343b21425ab339fe92fba50357cabc0d7350c1f1f5e192a0d65af651ddd25b9fc4f'
            'a815d5713ae7542efbed560a3f711dec0b0a9e7072873efa7563b695d136d6a0e50bb8e81eaa7d3b4a732a54090ce113d292dd3531deda6c3dbda76094888719'
            'd3dcc7377e7505332080a6dfa6d127851d8d5f541a67a0f5b7f2b42918e76dd223dfef6ad5cb3d3502050dcbac8a2cf58ddcdc18dc0e0df60c81b70f1b0003b3')

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

