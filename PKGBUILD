# Patches 'xshape.patch' and 'button_mask.patch' by Alexey Korop added.
# Original package info:
# $Id: PKGBUILD 284823 2016-12-26 19:43:10Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-mt
pkgver=1.10.6
pkgrel=1
pkgdesc='Lightweight system monitor for X'
url='https://github.com/brndnmtthws/conky'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'docbook2x' 'docbook-xml' 'man-db' 'git')
depends=('glib2' 'lua' 'wireless_tools' 'libxdamage' 'libxinerama' 'libxft'
         'imlib2' 'libxml2' 'libpulse')
source=("https://github.com/brndnmtthws/conky/archive/v${pkgver}.tar.gz"
        'xshape.patch'
        'button_mask.patch'
        'lua53.patch')
sha1sums=('54cb3322dc3a969f1fda03383012c61d57261345'
          'ba05be063488020bfbf0a594574ac58ed5a1eaec'
          'b5e774b6144164091852bab0996f79853664fb6f'
          'a3a74542b6524e5663ad37aaba292b48e8bea3b1')

options=('!strip' 'debug')

prepare() {
  mv "${srcdir}/conky-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../lua53.patch # lua_gettable returns an int in lua-5.3
	patch -p1 -i ../button_mask.patch
	patch -p1 -i ../xshape.patch # https://github.com/brndnmtthws/conky/issues/158
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake \
		-D CMAKE_BUILD_TYPE=Release \
		-D MAINTAINER_MODE=ON \
		-D BUILD_WLAN=ON \
		-D BUILD_XDBE=ON \
		-D BUILD_IMLIB2=ON \
		-D BUILD_XSHAPE=ON \
		-D BUILD_RSS=ON \
		-D BUILD_WEATHER_METAR=ON \
		-D BUILD_WEATHER_XOAP=ON \
		-D BUILD_PULSEAUDIO=ON \
		-D CMAKE_INSTALL_PREFIX=/usr \
		.

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
