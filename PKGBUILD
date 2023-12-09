# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgname='input-overlay'
pkgname=obs-plugin-${_pkgname}
pkgver=5.0.4
pkgrel=2
groups=('obs-plugins')
pkgdesc='obs-studio plugin to show keyboard, gamepad and mouse input on stream.'
arch=("x86_64")
url="https://github.com/univrsal/${_pkgname}"
license=('GPL')
depends=('obs-studio' 'libxtst' 'libxkbfile')
makedepends=('git' 'cmake')
source=(
	"git+https://github.com/univrsal/${_pkgname}.git#tag=v${pkgver}"
	"$pkgname-libuiohook-univrsal::git+https://github.com/univrsal/libuiohook.git"
	"$pkgname-libuiohook-submodule.patch::https://github.com/univrsal/input-overlay/commit/b7db35b53b1332e1e08d332d7c81e6296289df44.patch")
sha256sums=('SKIP'
            'SKIP'
            '0ace525bb60a3c9e52cd6f9bb091cc456338e80a8b80d2e77dce9638574cc5c3')

_srcdir="${_pkgname}"

prepare() {
	cd "${_srcdir}"
	patch -p1 -i "$srcdir/$pkgname-libuiohook-submodule.patch"
	
	git submodule init
	git config 'submodule.deps/libuiohook.url' "$srcdir/$pkgname-libuiohook-univrsal"
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
