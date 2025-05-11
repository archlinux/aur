# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgname='input-overlay'
pkgname=obs-plugin-${_pkgname}
pkgver=5.1.0
pkgrel=1
groups=('obs-plugins')
pkgdesc='obs-studio plugin to show keyboard, gamepad and mouse input on stream.'
arch=("x86_64")
url="https://github.com/univrsal/${_pkgname}"
license=('GPL-2.0-only')
depends=('obs-studio' 'libxtst' 'libxkbfile' 'sdl2' 'qt6-base')
makedepends=('git' 'cmake')
source=(
	"git+https://github.com/univrsal/${_pkgname}.git#tag=${pkgver}"
	"$pkgname-libuiohook-TolikPylypchuk::git+https://github.com/TolikPylypchuk/libuiohook.git")
sha256sums=('f6a5021b9ba606cf96b47f1b2bf78bd840e169dbcd45a80cd420db1f7ae14ac7'
            'SKIP')

_srcdir="${_pkgname}"

prepare() {
	cd "${_srcdir}"

	git submodule init
	git config 'submodule.deps/libuiohook.url' "$srcdir/$pkgname-libuiohook-TolikPylypchuk"
	git -c 'protocol.file.allow=always' submodule update

	sed -i '/set(CMAKE_CXX_FLAGS "-march=native")/d' 'CMakeLists.txt'
}

build() {
	CXXFLAGS="$CXXFLAGS -msse4.1" cmake -S "${_srcdir}" -B 'build' -DCMAKE_BUILD_TYPE='None' -DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build 'build'
}

package() {
	cd "${_srcdir}"
	install -dm755 "${pkgdir}/usr/lib/obs-plugins"
	install -dm755 "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/locale"
	install -dm755 "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/presets"
	install -Dm755 "${srcdir}/build/${_pkgname}.so" -t "${pkgdir}/usr/lib/obs-plugins/"
	cp -R 'data/locale'/* "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/locale/"
	cp -R 'presets'/* "${pkgdir}/usr/share/obs/obs-plugins/${_pkgname}/presets/"
}
