# Maintainer: MV <notfood.dev@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgbase='drawpile'
pkgname=("${pkgbase}"{,'-client','-server'})
pkgver=2.1.20
pkgrel=2
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('i686' 'x86_64')
url='https://drawpile.net/'
license=('GPL3')
makedepends=('cmake' 'extra-cmake-modules' 'karchive' 'qt5-multimedia' 'qt5-svg' 'qt5-tools' 'qt5-x11extras')
source=(
    "https://drawpile.net/files/src/${pkgbase}-${pkgver}.tar.gz")
sha256sums=(
    'a2f45e8b7482854288eb7b7f9db0961c79f0129ab92216280fdb94457e0d0fa9')

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
	depends=('desktop-file-utils' 'karchive' 'qt5-multimedia' 'qt5-x11extras')
	optdepends=('kdnssd: automatic service discovery (such as printers)'
		'giflib: GIF support'
		'miniupnpc: UPnP support'
		'qt5-color-widgets: alternative color wheel'
		'qtkeychain: Password storage')
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
