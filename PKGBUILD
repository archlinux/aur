# 'extra' data:
# $Id: PKGBUILD 284823 2016-12-26 19:43:10Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

# 'AUR' data:
# Patch 'xshape.patch' by Alexey Korop <akorop@ukr.net> added.
# Maintainer Alexey Korop <akorop@ukr.net>.

pkgname=conky-mt
pkgver=1.11.5
pkgrel=3
pkgdesc='Lightweight system monitor for X'
url='https://github.com/brndnmtthws/conky'
license=('BSD' 'GPL')
arch=('x86_64')
conflicts=('conky')
provides=('conky')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'man-db' 'git')
depends=('glib2' 'lua' 'wireless_tools' 'libxdamage' 'libxinerama' 'libxft'
         'imlib2' 'libxml2' 'libpulse' 'libxnvctrl')
source=("https://github.com/brndnmtthws/conky/archive/v${pkgver}.tar.gz"
        'xshape.patch'
)
sha256sums=('4cefdd92219a90934c28297e4ac7448a3f69d6aeec5d48c5763b23f6b214ef13'
            'e88d967ac00ffcda4bd85d7f175608246d795590007a4d0e481e8dfc13c486e6')
options=('!strip' 'debug')

prepare() {
  mv "${srcdir}/conky-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../xshape.patch # https://github.com/brndnmtthws/conky/issues/158
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake \
		-D CMAKE_BUILD_TYPE=Release \
		-D MAINTAINER_MODE=ON \
		-D BUILD_DOCS=ON \
		-D BUILD_WLAN=ON \
		-D BUILD_XDBE=ON \
		-D BUILD_XSHAPE=ON \
		-D BUILD_IMLIB2=ON \
		-D BUILD_CURL=ON \
		-D BUILD_RSS=ON \
		-D BUILD_NVIDIA=ON \
		-D BUILD_WEATHER_METAR=ON \
		-D BUILD_PULSEAUDIO=ON \
		-D BUILD_JOURNAL=ON \
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
