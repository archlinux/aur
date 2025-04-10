# Maintainer: zneix <zneix@zneix.eu>
# Contributor: Chen Jicheng <hi at chenjicheng dot com>

pkgname=obs-plugin-input-overlay-git
_pkgname=input-overlay
pkgver=5.1.0.r3.g0992c07
pkgrel=1
pkgdesc='OBS Studio plugin showing keyboard, gamepad or mouse input as sources.'
arch=('x86_64')
url='https://github.com/univrsal/input-overlay'
license=('GPL2')
groups=('obs-plugins')
depends=(
	'obs-studio>=28.0.0'
	'libuiohook'
	'pkgconf'
)
makedepends=(
	'cmake'
	'make'
	'gcc'
	'git'
)
provides=('obs-plugin-input-overlay')
conflicts=(
	'obs-plugin-input-overlay'
)
options=()
source=('input-overlay::git+https://github.com/univrsal/input-overlay.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
	[ -d _build ] || mkdir _build
	cd _build
	cmake ..
	make
}

package() {
	_prjdir="${srcdir}/${_pkgname}"
	install -D -m755 "${_prjdir}/_build/input-overlay.so" "${pkgdir}/usr/lib/obs-plugins/input-overlay.so"
	install -D -m644 "${_prjdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/input-overlay"
	cp -r "${_prjdir}/data/locale" "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/locale"
	cp -r "${_prjdir}/presets" "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/presets"
}
