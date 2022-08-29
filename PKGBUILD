# Maintainer: Luca Canavese <l.canavese@protonmail.com>
# Contributor: peace885 <reyadmin@gmail.com>
# Contributor: Thibault Boyeux <thibault.boyeux@gmail.com>
# Contributor: Army
# Contributor: Archer777
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Karol Cichy <slothck@gmail.com>

_pkgname=conky
pkgname=conky-cli
pkgver=1.12.2
pkgrel=2
pkgdesc="Lightweight system monitor for X, without X11 dependencies"
url='https://github.com/brndnmtthws/conky'
license=('BSD' 'GPL')
arch=('x86_64')
provides=('conky')
conflicts=('conky')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'man-db' 'git' 'catch2')
depends=('curl' 'lua' 'wireless_tools' 'libxml2')
source=("https://github.com/brndnmtthws/${_pkgname}/archive/v${pkgver}.tar.gz")
source=("https://github.com/brndnmtthws/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('a7eb112fe7a6bcd6c44706a53cbf6222e640cd1e585492fc654aa9e05a7bbc94')

options=('!strip' 'debug')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	# Unbundle catch2 to fix build with glibc 2.35
	rm -r tests/catch2
	ln -s /usr/include/catch2 tests
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

