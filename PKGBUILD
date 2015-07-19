# Maintainer: Archer777 <NAME at gmx dot com>
# Contributor: Army
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Karol Cichy <slothck@gmail.com>

_pkgname=conky
pkgname=conky-cli
pkgver=1.10.0
pkgrel=2
pkgdesc="Lightweight system monitor for X, without X11 dependencies"
url='http://conky.sourceforge.net/'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
provides=('conky')
conflicts=('conky')
makedepends=('cmake' 'docbook2x' 'docbook-xml' 'docbook-xsl' 'man-db')
depends=('curl' 'lua' 'wireless_tools' 'libxml2')
source=("https://github.com/brndnmtthws/${_pkgname}/archive/v${pkgver}.tar.gz"
        'ascii.patch'
        'lua53.patch'
        'ipv6.patch'
        'curl.patch')
md5sums=('cdc0298e5f257829d574ae8114170d9b'
         'd5b765cb7400d2fdca88b6c86aa8eec1'
         '44cdadfe92266e99698e5424b7c6e265'
         '702650dfaaacb4e778f3d3c6a296df0b'
         '8236606ca3d39b9d00a59022d4f953ac')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 -i ../ascii.patch # db2x_manxml fails on non-ascii chars
	patch -p1 -i ../lua53.patch # lua_gettable returns an int in lua-5.3
	patch -p1 -i ../ipv6.patch # https://bugs.archlinux.org/task/45626
	patch -p1 -i ../curl.patch # https://github.com/bagder/curl/issues/342
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
