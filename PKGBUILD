# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='hevcesbrowser'
pkgver='1.0.47.100316'
pkgrel='2'
pkgdesc="a tool for analyzing HEVC (h265) bitstreams"
arch=('any')
license=('GPL')
options=('!emptydirs')
depends=('qt5-base boost')
builddepends=('cmake')
url='https://github.com/virinext/hevcesbrowser'
source=("hevcesbrowser.tar.gz::https://github.com/virinext/${pkgname}/archive/head.tar.gz"
        "qhexview::git://github.com/virinext/QHexView.git#commit=314300a477976897ae46542a76ef31b8b05b897d")
sha512sums=('3842d123e06e1f59454db5f92955bac6daadefb2c398bbdd5580f02cbf2059049b36e9337cc351d73b424d7eec16c3cfa0269b6596a9e3fedb1ab14332abceda'
            'SKIP')

build() {
  cd "${srcdir}/hevcesbrowser-head/external"
  rm -rf QHexView
  ln -s "${srcdir}/qhexview" QHexView

  cd "${srcdir}/hevcesbrowser-head"
  rm -rf project
  mkdir project
  cd project
  cmake ..
  make

  cd ../utils/hevc_es_browser_gui
  qmake-qt5 hevc_es_browser_gui.pro
  make gitinfo
  make
}

package() {
  cd "${srcdir}/hevcesbrowser-head"
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
