# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=ginkgo-cadx-2
_realpkgname=ginkgo-cadx
pkgver=2.14.0.4972
pkgrel=2
pkgdesc="Complete DICOM viewer solution"
arch=('i686' 'x86_64')
url="http://ginkgo-cadx.com/"
license=('LGPL3')
makdepends=('cmake')
depends=('dcmtk' 'insight-toolkit' 'tcp_wrappers' 'vtk' 'wxgtk2.8')
conflicts=('ginkgo-cadx')
install="${_realpkgname}.install"
options=('!strip')
source=("http://downloads.sourceforge.net/project/ginkgocadx/${pkgver%.*}/${_realpkgname/-/}-${pkgver}.tgz"
        "itk-4.0.patch"
        "vtk-5.10.patch"
        "translations.patch"
        "ginkgocadx.desktop"
        "ginkgocadx.png")
md5sums=('a52f7d2319195224e675b6e1af088947'
         '0cc4bacb5b1378e2865669887688e06f'
         '9e9bccebcd37bf9ae7aaa8198a4c1266'
         '7085e99c2689c3e70317e8af23599cb4'
         '16998d859432ab9348a9e835d0135a98'
         '1de087126d5e72ecdacc2e215601827f')

prepare() {
  [ -d build ] || mkdir build
  cd "${srcdir}/${_realpkgname/-/}-${pkgver}"
  patch -Np1 -i "${srcdir}/itk-4.0.patch"
  patch -Np1 -i "${srcdir}/vtk-5.10.patch"
  patch -Np1 -i "${srcdir}/translations.patch"
}

build() {
  cd build
  LDFLAGS=-L/usr/lib/dcmtk cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_LIBRARY_PATH=/usr/lib/dcmtk -DVTK_DIR=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE="/usr/bin/wx-config-2.8" -DwxWidgets_wxrc_EXECUTABLE="/usr/bin/wxrc-2.8" "../${_realpkgname/-/}-${pkgver}"
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/ginkgocadx.desktop" "${pkgdir}/usr/share/applications/ginkgocadx.desktop"
  install -D -m644 "${srcdir}/ginkgocadx.png" "${pkgdir}/usr/share/pixmaps/ginkgocadx.png"
}

# vim:set ts=2 sw=2 et:
