# Maintainer: alexiobash < me (at) alexiobash (dot) com >

pkgname=conky-lua
_pkgname=conky
pkgver=1.10.1
pkgrel=2
pkgdesc='Lightweight system monitor for X, with Lua support enabled'
url='http://github.com/brndnmtthws/conky'
license=('BSD' 'GPL3')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('docbook2x' 'tolua++' 'perl-xml-libxml' 'cmake' 'docbook-xsl' 'docbook-xml' 'perl-xml-libxml')
depends=('alsa-lib' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2' 'lua51' 'cairo')
provides=('conky=1.10.1')
conflicts=('conky')
backup=('etc/conky/conky.conf' 'etc/conky/conky_no_x11.conf')
source=("https://github.com/brndnmtthws/${_pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('97b59ec1daf54126b30516e8663a9cf1f218d8ae')

replaces=('torsmo')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	CPPFLAGS="${CXXFLAGS}" LIBS="${LDFLAGS}" LUA_LIBS="-llua5.1" LUA_CFLAGS="-I/usr/include/lua5.1" \
        cmake \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release \
		-D MAINTAINER_MODE=ON \
		-D BUILD_CURL=ON \
		-D BUILD_LUA_RSVG=ON \
		-D BUILD_LUA_CAIRO=ON \
		-D BUILD_LUA_IMLIB2=ON \
		-D BUILD_IMLIB2=ON \
		-D BUILD_RSS=ON \
		-D BUILD_WEATHER_METAR=ON \
		-D BUILD_WEATHER_XOAP=ON \
		-D BUILD_XDBE=ON \
		. 


	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 LICENSE.BSD ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}/cmake"
	sed -i "s|tolua++ |toluapp |g" ConkyPlatformChecks.cmake
}
