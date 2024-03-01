# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hypridle"
pkgname="${_pkgname}-git"
pkgver=0.1.1.r2.g029f0880
pkgrel=1
pkgdesc="Hyprland's idle daemon"
arch=(any)
url="https://github.com/hyprwm/hypridle"
license=('BSD')
depends=('wayland' 'hyprlang>=0.4.0' 'sdbus-cpp')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'gdb' 'meson' 'systemd' 'wayland-protocols' 'xorgproto')
source=("${_pkgname}::git+https://github.com/hyprwm/hypridle.git")
provides=("hypridle")
conflicts=("hypridle")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B ./build
    cmake --build ./build --config Release --target hypridle
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="${pkgdir}" cmake --install build

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
