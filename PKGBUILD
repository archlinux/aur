# Maintainer:  Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor:  prettyvanilla <prettyvanilla at lavabit dot com>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Pierre Schmitz <pierre at archlinux dot de>
# Contributor: Dany Martineau <dany.luc.martineau at gmail dot com>
# Contributor: sausageandeggs <sausageandeggs at archlinux dot us>

pkgname=kdebase-dolphin-klook
_pkgname=kdebase-dolphin
pkgver=15.04.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Dolphin File Manager with KLook enabled"
url="http://kde.org/applications/system/dolphin/"
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdebase')
depends=('baloo4-widgets' 'kdebase-lib' 'kdebase-runtime' 'klook-git')
makedepends=('automoc4' 'cmake' 'kdelibs' 'tidyhtml')
optdepends=('kdegraphics-svgpart: thumbailers for SVG files'
            'kdegraphics-thumbnailers: thumbnailers for various graphics files'
            'kdemultimedia-ffmpegthumbs: thumbnailers for video files'
            'kdemultimedia-mplayerthumbs: thumbnailers for video files'
            'kdesdk-thumbnailers: thumbnailers for development files'
            'icoutils: thumbnailers for MS files'
            'ruby: servicemenu installation'
            'konsolepart4: open terminal in context menu')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("http://download.kde.org/stable/applications/${pkgver}/src/kde-baseapps-${pkgver}.tar.xz"
        "https://abf.rosalinux.ru/openmandriva/kde-baseapps/raw/master/kdebase-14.11.97-dolphin-klook.patch")
sha1sums=('18ec78a547ca68b110d3b82a12a0001bf62d0b66'
          'efb731b4659500533f6ccd58bc24127a1090d007')

prepare() {
  rm -rf build
  mkdir build

  cd "kde-baseapps-${pkgver}"
  patch -Np1 -i "${srcdir}/kdebase-14.11.97-dolphin-klook.patch"
}

build() {
  cd build
  cmake "../kde-baseapps-${pkgver}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DKDE4_BUILD_TESTS=OFF \
      -DCMAKE_SKIP_RPATH=ON \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build/dolphin"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/build/doc/dolphin"
  make DESTDIR="${pkgdir}" install
}
