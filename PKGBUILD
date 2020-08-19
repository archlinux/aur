# Maintainer: MV <notfood.dev@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgbase='drawpile'
pkgname=("${pkgbase}"{,'-client','-server'})
pkgver=2.1.17
pkgrel=1
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('i686' 'x86_64')
url='http://drawpile.net/'
license=('GPL3')
makedepends=('cmake' 'extra-cmake-modules' 'karchive' 'qt5-multimedia' 'qt5-svg' 'qt5-tools' 'qt5-x11extras')
source=("http://drawpile.net/files/src/${pkgbase}-${pkgver}.tar.gz" "qtfix.diff::https://github.com/drawpile/Drawpile/commit/b46115160c5587aae9306e57d4223906e74ed512.diff")
sha256sums=('ee7f7ba81e6f1a9c3c32275f84364d10713c24ec040da8cb4b13c3ea6bb09086' '5b9f5d42f0db081496f9c5bde295751dba0e029dac7bf0a0b0c1d32eef60c5de')

_cmakeargs+=('-Wno-dev' '-DKIS_TABLET=ON' '-DSERVER=OFF' '-DSERVERGUI=OFF')

prepare() {
	cd "${pkgbase}-${pkgver}"
	
	patch --forward --strip=1 --input="${srcdir}/qtfix.diff"
}

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
