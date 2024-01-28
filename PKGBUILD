# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_pkgname=lincity-ng
pkgname=${_pkgname}-git
epoch=1
pkgver=2.9.0.r144.gd4066f9e
pkgrel=1
pkgdesc="A city simulation game (development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/lincity-ng/lincity-ng"
license=('GPL2')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%.r*}")
depends=('sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'sdl2_gfx' 'physfs' 'libxml2' 'libgl')
makedepends=('git' 'cmake' 'mesa' 'glu')
source=("${_pkgname}::git+${url}"
        "fix_xml_eisdir.patch") #https://github.com/lincity-ng/lincity-ng/pull/102
sha256sums=('SKIP'
            '6f034a0628ebcbeaafdd5e00fe911132eacd4e67ab1792752960e035ce117186')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^lincity-ng-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd ${_pkgname}
  patch -uNp1 -r- -i ../fix_xml_eisdir.patch
}
  
build () {
  cd ${_pkgname}
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package () {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
