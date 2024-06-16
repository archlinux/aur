# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgname='input-overlay'
pkgname=obs-plugin-${_pkgname}
pkgver=5.0.5
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
	"$pkgname-libuiohook-univrsal::git+https://github.com/univrsal/libuiohook.git#commit=bee164726dc62e8f8c3a1a4a778164ce8a769143")
sha256sums=('384e406f30dbf9241d20521f4ea32113be21340708f204b2fdc00f4b6a880d90'
            'a72d5c5a0963c44973e674ae088ab18dcc9c6f1e5251b8a5f3a02188455be49e')

_srcdir="${_pkgname}"

prepare() {
	cd "${_srcdir}"

	git submodule init
	git config 'submodule.deps/libuiohook.url' "$srcdir/$pkgname-libuiohook-univrsal"
	git -c 'protocol.file.allow=always' submodule update --remote

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
