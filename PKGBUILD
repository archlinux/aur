# Maintainer: Chen Jicheng <hi@chenjicheng.com>
pkgname=obs-plugin-input-overlay-git
_pkgname=input-overlay
pkgver=5.0.0.rc1.r60.g5a3035e
pkgrel=1
pkgdesc="Show keyboard, gamepad and mouse input on stream"
arch=('x86_64')
url="https://github.com/univrsal/input-overlay"
license=('GPL2')
groups=('obs-plugins')
depends=(
	'obs-studio>=19.0.3'
	'libuiohook'
)
makedepends=(
	'cmake'
	'make'
	'gcc'
	'git'
)
conflicts=(
	'obs-plugin-input-overlay'
	'obs-plugin-input-overlay-bin'
)
source=("git+https://github.com/univrsal/input-overlay.git#branch=master")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
	cmake .
	make
}

package() {
	_prjdir="${srcdir}/${_pkgname}/projects"
	install -D -m755 "${_prjdir}/plugin/input-overlay.so" "${pkgdir}/usr/lib/obs-plugins/input-overlay.so"
	install -D -m644 "${srcdir}/${_pkgname}/COPYING.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/input-overlay"
	cp -r "${_prjdir}/plugin/data/locale" "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/locale"
	cp -r "${_prjdir}/presets" "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/presets"
}
