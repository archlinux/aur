# Maintainer : Chris Sakalis <chrissakalis@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-nvidia
_pkgname=conky
pkgver=1.10.3
pkgrel=1
pkgdesc='Lightweight system monitor for X'
provides=('conky')
conflicts=('conky')
url='http://conky.sourceforge.net/'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'docbook2x' 'docbook-xml' 'man-db' 'perl-xml-libxml' 'perl-xml-sax-expat')
depends=('glib2' 'curl' 'lua' 'wireless_tools' 'libxml2' 'libxft' 'libxdamage' 'libxinerama' 'imlib2' 'libxnvctrl')
source=("https://github.com/brndnmtthws/conky/archive/v${pkgver}.tar.gz"
        'ascii.patch'
        'lua53.patch')
sha1sums=('971b20be2d8c2e676374441469e8525708500776'
          '96cdbc38e8706c8a3120601983df5c7265716128'
          'a3a74542b6524e5663ad37aaba292b48e8bea3b1')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 -i ../ascii.patch # db2x_manxml fails on non-ascii chars
	patch -p1 -i ../lua53.patch # lua_gettable returns an int in lua-5.3
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	cmake \
		-D CMAKE_BUILD_TYPE=Release \
		-D MAINTAINER_MODE=ON \
		-D BUILD_CURL=ON \
		-D BUILD_IBM=ON \
		-D BUILD_IMLIB2=ON \
		-D BUILD_NVIDIA=ON \
		-D BUILD_RSS=ON \
		-D BUILD_WEATHER_METAR=ON \
		-D BUILD_WEATHER_XOAP=ON \
		-D BUILD_WLAN=ON \
		-D BUILD_XDBE=ON \
		-D CMAKE_INSTALL_PREFIX=/usr \
		.

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
