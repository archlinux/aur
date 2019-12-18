# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Beini <bane@iki.fi>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-git
pkgver=1.11.5.r10.g26d23cb7
pkgrel=1
pkgdesc="Lightweight system monitor for X"
url="https://github.com/brndnmtthws/${pkgname%-git}"
license=('BSD' 'GPL')
arch=('x86_64')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'man-db' 'git')
depends=('glib2' 'lua' 'wireless_tools' 'libxdamage' 'libxinerama' 'libxft'
         'imlib2' 'libxml2' 'libpulse' 'libxnvctrl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha1sums=('SKIP')
options=('!strip' 'debug')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

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
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
