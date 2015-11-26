# Patches 'execgraph.patch' and 'xshape.patch' by Alexey Korop added. 
# Original package info:
# $Id: PKGBUILD 251435 2015-11-19 21:45:56Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-mt
pkgver=1.10.1
pkgrel=1
pkgdesc='Lightweight system monitor for X'
url='https://github.com/brndnmtthws/conky'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'docbook2x' 'docbook-xml' 'man-db' 'git')
depends=('glib2' 'curl' 'lua' 'wireless_tools' 'libxml2' 'libxft' 'libxdamage' 'imlib2')
conflicts=('conky')
provides=('conky')
source=("https://github.com/brndnmtthws/conky/archive/v${pkgver}.tar.gz"
        'lua53.patch'
        'xshape.patch'
        'execgraph.patch')
sha1sums=('97b59ec1daf54126b30516e8663a9cf1f218d8ae'
          'a3a74542b6524e5663ad37aaba292b48e8bea3b1'
          '930f9d0313b7e32b895b75aa92be2cb128f957ed'
          '7615818bc255032dc4f5eeba9a2e009b9a7c177c')

options=('!strip' 'debug')

prepare() {
  mv "${srcdir}/conky-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../lua53.patch # lua_gettable returns an int in lua-5.3
	patch -p1 -i ../xshape.patch # https://github.com/brndnmtthws/conky/issues/158
	patch -p1 -i ../execgraph.patch # https://github.com/brndnmtthws/conky/issues/153
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake \
		-D CMAKE_BUILD_TYPE=Release \
		-D MAINTAINER_MODE=ON \
		-D BUILD_CURL=ON \
		-D BUILD_XDBE=ON \
		-D BUILD_IMLIB2=ON \
		-D BUILD_XSHAPE=ON \
		-D BUILD_RSS=ON \
		-D BUILD_WEATHER_METAR=ON \
		-D BUILD_WEATHER_XOAP=ON \
		-D BUILD_WLAN=ON \
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
