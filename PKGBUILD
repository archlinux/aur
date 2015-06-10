# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Anonymo <meowdib at gmail dot com>

pkgname=clarity-icon-theme
pkgver=0.4.0
pkgrel=3
pkgdesc="Vector icons in 8 colourthemes for GTK"
arch=('any')
makedepends=('imagemagick' 'librsvg')
url="http://gnome-look.org/content/show.php/Clarity?content=135654"
license=('GPL3')
options=(!strip !zipman)
source=(http://load.boenki.org/${pkgname}_${pkgver}.tar.gz
        $pkgname-rsvg.patch::https://github.com/jcubic/Clarity/commit/eec45bfefd0874b059aaf7926d134cc31ad7fd31.patch
        $pkgname-huge-icons.patch::https://github.com/jcubic/Clarity/commit/63d2a085b11c5315c10fc115d4bbc4610ba6ed24.patch)
md5sums=('4f843a762272967b177ebfa18b54fd6e'
         'ce4559e558d4f19577cfd72bb2aabeb8'
         '27161dd28fc51bfa0da84aa193444811')

##############################################################
#Put the themes you want to build in _buildtheme array below.#
#By default all themes will be built.                        #
#                                                            #
#Available themes:                                           #
# violaceus      - violet/pink gradient                      #
# lux_violaceus  - glossy variant                            #
# canus          - grey gradient                             #
# dark_canus     - dark grey gradient                        #
# caeruleus      - blue gradient                             #
# lux_caeruleus  - glossy variant                            #
# viridis        - green gradient                            #
# luteus         - orange gradient                           #
##############################################################

_buildtheme=(violaceus lux_violaceus canus dark_canus caeruleus lux_caeruleus viridis luteus)

prepare() {
 cd "${srcdir}/${pkgname}_${pkgver}"
 patch -p1 -i ../$pkgname-rsvg.patch
 patch -p1 -i ../$pkgname-huge-icons.patch
}

build() {
 for _theme in ${_buildtheme[*]}; do
  cd "${srcdir}/${pkgname}_${pkgver}"
  msg "Building theme ${_theme}"
  make ${_theme}
  make arch
  install -d themes/${_theme}
  cp -r {scalable,16x16,index.theme} themes/${_theme}
  sed -i s/Name=Clarity/Name=Clarity-${_theme}/ themes/${_theme}/index.theme
 done
}

package() {
 for _theme in ${_buildtheme[*]}; do
  install -d "${pkgdir}/usr/share/icons/clarity-${_theme}"
  cp -r ${srcdir}/${pkgname}_${pkgver}/themes/${_theme}/{scalable,16x16,index.theme} \
   "${pkgdir}/usr/share/icons/clarity-${_theme}"

  cd "${pkgdir}/usr/share/icons/clarity-${_theme}"
  ln -s applications-science.svg scalable/categories/applications-education.svg
  ln -s applications-science.png 16x16/categories/applications-education.png
 done
}
