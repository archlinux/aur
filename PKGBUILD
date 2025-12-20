# Maintainer: MV <notfood.dev@gmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgbase='drawpile'
pkgname=("${pkgbase}"{,'-client','-server','-tools'})
pkgver=2.3.0
pkgrel=2
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('i686' 'x86_64')
url='https://drawpile.net/'
license=('GPL3')
makedepends=('cmake' 'extra-cmake-modules' 'libzip' 'qt6-multimedia' 'qt6-svg' 'qt6-tools')
source=(
    "https://github.com/drawpile/Drawpile/archive/refs/tags/${pkgver}.tar.gz"
    'QT6_fix.patch')
sha256sums=(
    'd09d3eef00b15004184700817d1b6620acc4cfd0738ad8977680c1e05bc2ea7d'
    '03242dd19518e525832c1a67a5df946f62cd383b56d0f413e0c43ae0246c4e6a')

_cmakeargs+=(
		'--preset linux-release-qt6-all-make'
		'-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF'
		'-DCMAKE_INSTALL_PREFIX=/usr'
		'-DSOURCE_ASSETS=OFF')

prepare() {
	cd "Drawpile-${pkgver}"
	patch -Np1 -i ../QT6_fix.patch
}

build() {
	cd "Drawpile-${pkgver}"
	cmake "${_cmakeargs[@]}" -B build
	cmake --build build
}

package_drawpile() {
	pkgdesc+=' (meta package)'
	arch=('any')
	depends=("${pkgbase}-client" "${pkgbase}-server" "${pkgbase}-tools")
	
	cd "Drawpile-${pkgver}"
	
	DESTDIR="${srcdir}/pkg" cmake --install build
}

package_drawpile-client() {
	pkgdesc+=' (client)'
	depends=('desktop-file-utils' 'libzip' 'qt6-multimedia')
	optdepends=('qtkeychain-qt6: Password storage')
	install="${pkgbase}.install"
	
	cd "Drawpile-${pkgver}"
	
	mkdir -p "${pkgdir}"/usr/{bin,share}
	cp -r "${srcdir}"/pkg/usr/share/* "${pkgdir}"/usr/share
	cp "${srcdir}"/pkg/usr/bin/drawpile "${pkgdir}"/usr/bin
}

package_drawpile-server() {
	pkgdesc+=' (server)'
	depends=('libzip')
	optdepends=('libmicrohttpd: web-admin feature'
		'libsodium: ext-auth support'
		'libsystemd: systemd and logging support'
		'qt6-websockets: web-client support')
	
	cd "Drawpile-${pkgver}"

	mkdir -p "${pkgdir}"/usr/bin
	cp "${srcdir}"/pkg/usr/bin/drawpile-srv "${pkgdir}"/usr/bin
}

package_drawpile-tools() {
	pkgdesc+=' (tools)'
	depends=('cargo')
	
	cd "Drawpile-${pkgver}"

	mkdir -p "${pkgdir}"/usr/bin
	cp "${srcdir}"/pkg/usr/bin/{dprectool,drawpile-cmd,drawpile-timelapse} "${pkgdir}"/usr/bin
}
