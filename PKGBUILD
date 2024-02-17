# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hypridle"
pkgname="${_pkgname}-git"
pkgver=0.0.1.r15.39b8afb
pkgrel=1
pkgdesc="Hyprland's idle daemon."
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
	cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
