# Maintainer: Thibault Boyeux <thibault.boyeux@gmail.com>
# Contributor: Army
# Contributor : Archer777
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Karol Cichy <slothck@gmail.com>

_pkgname=conky
pkgname=conky-cli
pkgver=1.10.8
pkgrel=1
pkgdesc="Lightweight system monitor for X, without X11 dependencies"
url='https://github.com/brndnmtthws/conky'
license=('BSD' 'GPL')
arch=('x86_64')
provides=('conky')
conflicts=('conky')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'man-db' 'git')
depends=('curl' 'lua' 'wireless_tools' 'libxml2')
source=("https://github.com/brndnmtthws/${_pkgname}/archive/v${pkgver}.tar.gz"
        'lua53.patch')

sha256sums=('2ebd655a27c816bd613538b71d4ec1c096252cb522feaa05f64781dcedea8857'
          '50844ccdd2b1f8e1b4b110d8b9069dc35af11650163013e2b98cc2e59aeda569')

options=('!strip' 'debug')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 -i ../lua53.patch # lua_gettable returns an int in lua-5.3
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

