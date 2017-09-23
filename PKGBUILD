# Maintainer: Thibault Boyeux <thibault.boyeux@gmail.com>
# Contributor: Army
# Contributor : Archer777
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Karol Cichy <slothck@gmail.com>

_pkgname=conky
pkgname=conky-cli
pkgver=1.10.6
pkgrel=1
pkgdesc="Lightweight system monitor for X, without X11 dependencies"
url='https://github.com/brndnmtthws/conky'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
provides=('conky')
conflicts=('conky')
makedepends=('cmake' 'docbook2x' 'docbook-xml' 'man-db' 'git')
depends=('curl' 'lua' 'wireless_tools' 'libxml2')
source=("https://github.com/brndnmtthws/${_pkgname}/archive/v${pkgver}.tar.gz"
        'lua53.patch'
        'gcc7.patch')

sha256sums=('4c80982960b2a72e3e33cef33347c97b9239ed110d9584da4e7f17f28faf60ca'
          '50844ccdd2b1f8e1b4b110d8b9069dc35af11650163013e2b98cc2e59aeda569'
          '55ed017f56e657df4528b38ecafaab234ad164a899e19d704f6b397f4c82657b')

options=('!strip' 'debug')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 -i ../lua53.patch # lua_gettable returns an int in lua-5.3
	patch -p1 -i ../gcc7.patch # FS#54223
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	cmake \
		-D CMAKE_BUILD_TYPE=Release \
		-D MAINTAINER_MODE=ON \
        -D BUILD_HDDTEMP=OFF \
        -D BUILD_PORT_MONITORS=OFF \
		-D BUILD_WEATHER_METAR=ON \
		-D BUILD_WEATHER_XOAP=ON \
        -D BUILD_X11=OFF \
        -D BUILD_XDAMAGE=OFF \
        -D BUILD_XFT=OFF \
		-D BUILD_WLAN=ON \
		-D CMAKE_INSTALL_PREFIX=/usr \
		.

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
