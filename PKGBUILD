# Maintainer: MV <notfood.dev@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgbase='drawpile'
pkgname=("${pkgbase}"{,'-client','-server'})
pkgver=2.1.11
pkgrel=1
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('i686' 'x86_64')
url='http://drawpile.net/'
license=('GPL3')
makedepends=('karchive' 'qt5-multimedia' 'qt5-tools' 'qt5-svg' 'cmake' 'extra-cmake-modules')
source=("http://drawpile.net/files/src/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('75b3050441bfc54dddfbb5bd2231a13428e5deef52c49c9319536ea6f2df2503')

_cmakeargs+=('-Wno-dev' '-DKIS_TABLET=ON')

build() {
	cd "${pkgbase}-${pkgver}"

	# Ensure build is an empty directory
	rm -rf 'build'
	mkdir -p 'build'
	cd 'build'

	cmake .. -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr' "${_cmakeargs[@]}"
	make
}

package_drawpile() {
	pkgdesc+=' (meta package)'
	arch=('any')
	depends=("${pkgbase}-client" "${pkgbase}-server")
	conflicts=("${pkgbase}-common")
}

package_drawpile-client() {
	pkgdesc+=' (client)'
	depends=('karchive' 'qt5-multimedia' 'desktop-file-utils')
	optdepends=('kdnssd: automatic service discovery (such as printers)'
		'giflib: GIF support'
		'miniupnpc: UPnP support'
		'qt5-color-widgets: alternative color wheel')
	install="${pkgbase}.install"
	cd "${pkgbase}-${pkgver}"

	DESTDIR="${pkgdir}" make -C 'build' install
	rm -rfv "${pkgdir}"/usr/bin/drawpile-srv
}

package_drawpile-server() {
	pkgdesc+=' (server)'
	depends=('karchive')
	optdepends=('libmicrohttpd: web-admin feature'
		'libsystemd: systemd and logging support')
	cd "${pkgbase}-${pkgver}"

	DESTDIR="${pkgdir}" make -C 'build' install
	rm -rfv "${pkgdir}"/usr/{share,bin/drawpile{,-2.*}}
}
