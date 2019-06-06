# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Anonymo <meowdib at gmail dot com>

pkgname=clarity-icon-theme
pkgver=0.5.1
pkgrel=1
pkgdesc="Vector icons in 9 colourthemes for GTK"
arch=('any')
makedepends=('imagemagick' 'librsvg')
url="https://www.gnome-look.org/p/1012535"
license=('CCPL:by-sa')
options=(!strip !zipman !makeflags)
source=($pkgname-$pkgver.tar.gz::https://github.com/jcubic/Clarity/archive/$pkgver.tar.gz)
md5sums=('08c0c5d7062c6423765195132b4ceeb1')

##############################################################
#Put the themes you want to build in _buildtheme array below.#
#By default all themes will be built.                        #
#                                                            #
#Available themes:                                           #
# violaceus      - violet/pink gradient                      #
# lux_violaceus   -  glossy variant                          #
# canus          - grey gradient                             #
# dark_canus     - dark grey gradient                        #
# caeruleus      - blue gradient                             #
# lux_caeruleus   -  glossy variant                          #
# viridis        - green gradient                            #
# luteus         - orange gradient                           #
# albus          - white solid                               #
##############################################################

_buildtheme=(violaceus lux_violaceus canus dark_canus caeruleus lux_caeruleus viridis luteus albus)

build() {
 for _theme in ${_buildtheme[*]}; do
  cd "${srcdir}/Clarity-${pkgver}"
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
  cp -r "${srcdir}/Clarity-${pkgver}/themes/${_theme}/"{scalable,16x16,index.theme} \
   "${pkgdir}/usr/share/icons/clarity-${_theme}"

  cd "${pkgdir}/usr/share/icons/clarity-${_theme}"
  ln -s applications-science.svg scalable/categories/applications-education.svg
  ln -s applications-science.png 16x16/categories/applications-education.png
 done
}
