# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="hyprpicker"
pkgname="${_pkgname}-git"
pkgver=r8.0fc1134
pkgrel=1
pkgdesc="A wlroots-compatible Wayland color picker that does not suck."
arch=(any)
url="https://github.com/hyprwm/hyprpicker"
license=('BSD')
depends=(wayland)
makedepends=(
	git
	cmake
	ninja
	gcc
	gdb
	meson
	wayland-protocols
	xorgproto)
source=("${_pkgname}::git+https://github.com/hyprwm/hyprpicker.git")
conflicts=("${_pkgname}")
provides=(hyprpicker)
sha256sums=('SKIP')
options=(!makeflags !buildflags !strip)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/${_pkgname}"
	make all
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 build/hyprpicker -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
