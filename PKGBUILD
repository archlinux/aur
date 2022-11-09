# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='hevcesbrowser'
pkgver='1.0.80.120121'
pkgrel='2'
pkgdesc="a tool for analyzing HEVC (h265) bitstreams"
arch=('i686' 'x86_64')
license=('GPL')
options=('!emptydirs')
depends=('qt5-base' 'boost-libs')
makedepends=('cmake')
url='https://github.com/virinext/hevcesbrowser'
source=("hevcesbrowser-${pkgver}.tar.gz::https://github.com/virinext/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "qhexview::git+https://github.com/virinext/QHexView.git#commit=314300a477976897ae46542a76ef31b8b05b897d")
sha512sums=('d3e41736319c0da710c75e54cf4079d0f26a966267bf6d7e5fc849e43c403becfd95152b0687fea2decf460677ba53913bf1c4b92bc3d6e98162bdbc80b48201'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  rm -rf build external/QHexView

  ln -s "${srcdir}/qhexview" external/QHexView
  mkdir build

  cd build
  cmake ..
  make

  cd ../utils/hevc_es_browser_gui
  qmake-qt5 hevc_es_browser_gui.pro
  make gitinfo
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/hevcesbrowser         "${pkgdir}/usr/bin/hevcesbrowser"
  install -Dm755 build/hevcesbrowser_console "${pkgdir}/usr/bin/hevcesbrowser_console"
  install -Dm644 LICENSE                     "${pkgdir}/usr/share/doc/hevcesbrowser/LICENSE"
  install -Dm644 README.md                   "${pkgdir}/usr/share/doc/hevcesbrowser/README.md"
  install -Dm644 History.txt                 "${pkgdir}/usr/share/doc/hevcesbrowser/History.txt"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
