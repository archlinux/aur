# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgname='input-overlay'
pkgname=obs-plugin-${_pkgname}
pkgver=5.0.3
pkgrel=1
groups=('obs-plugins')
pkgdesc='obs-studio plugin to show keyboard, gamepad and mouse input on stream.'
arch=("x86_64")
url="https://github.com/univrsal/${_pkgname}"
license=('GPL')
depends=('obs-studio' 'libxtst' 'libxkbfile')
makedepends=('git' 'cmake')
source=(
	"git+https://github.com/univrsal/${_pkgname}.git#tag=v${pkgver}"
	"$pkgname-libgamepad::git+https://github.com/univrsal/libgamepad.git"
	"$pkgname-libuiohook::git+https://github.com/kwhat/libuiohook.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

_srcdir="${_pkgname}"

prepare() {
	cd "${_srcdir}"
	git submodule init
	git config 'submodule.deps/libgamepad.url' "$srcdir/$pkgname-libgamepad"
	git config 'submodule.deps/libuiohook.url' "$srcdir/$pkgname-libuiohook"
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
