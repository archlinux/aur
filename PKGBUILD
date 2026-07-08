# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=nativefiledialog-extended
_commit="3cd252a8f7ca32419b1ca235c2990ba6a0ecba7c"
pkgver=1.3.0+8+g${_commit:0:8}
pkgrel=1
pkgdesc="Cross platform (Windows, Mac, Linux) native file dialog library"
arch=('x86_64')
url="https://github.com/btzy/nativefiledialog-extended"
conflicts=('libnfd')
depends=('glibc' 'glib2' 'gtk3' 'dbus' 'wayland')
makedepends=('cmake' 'wayland-protocols')
license=('Zlib')
_srcname="nativefiledialog-extended-${_commit}"
source=(
	"${_srcname}.tar.gz::https://github.com/btzy/nativefiledialog-extended/archive/${_commit}.tar.gz"
)
sha256sums=('3ea216a6f7cac2fefbd7dc1ce1deebf623a7f7d3022ee1d00277faccf2abd634')

prepare() {
	cd "${_srcname}"
	rm -rf 3ps/wayland-protocols
	ln -vsf /usr/share/wayland-protocols -T 3ps/wayland-protocols
}

build() {
	cmake -S "${_srcname}" -B build \
		-Wno-dev \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		# EOL
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "${_srcname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
