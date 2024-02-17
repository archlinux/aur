# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hypridle"
pkgname="${_pkgname}-git"
pkgver=0.1.0.r0.gcd592840
pkgrel=1
pkgdesc="Hyprland's idle daemon"
arch=(any)
url="https://github.com/hyprwm/hypridle"
license=('BSD')
depends=(wayland hyprland)
makedepends=(
	git
	cmake
	ninja
	gcc
	gdb
	meson
	wayland-protocols
	xorgproto)
source=("${_pkgname}::git+https://github.com/hyprwm/hypridle.git")
conflicts=("${_pkgname}")
provides=(hypridle)
sha256sums=('SKIP')
options=(!makeflags !buildflags !strip)

pkgver() {
  	cd ${_pkgname}
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}


build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
    cmake --build ./build --config Release --target hypridle -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 build/hypridle -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
