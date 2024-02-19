# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>

_pkgname="hyprlock"
pkgname="${_pkgname}-git"
pkgver=0.1.0.r14.641563e
pkgrel=1
pkgdesc=" Hyprland's GPU-accelerated screen locking utility "
arch=(any)
url="https://github.com/hyprwm/hyprlock"
license=('BSD')
depends=('wayland' 'hyprlang>=0.4.0' 'cairo' 'pango' 'pam' 'libxkbcommon')
makedepends=('git' 'cmake' 'ninja' 'gcc' 'gdb' 'meson' 'wayland-protocols' 'xorgproto')
source=("${_pkgname}::git+https://github.com/hyprwm/hyprlock.git")
conflicts=("${_pkgname}")
provides=(hyprlock)
sha256sums=('SKIP')
options=(!makeflags !buildflags !strip)

pkgver() {
  	cd ${_pkgname}
	( set -o pipefail
      git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
        | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g' ||
        printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}


build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
    cmake --build ./build --config Release --target hyprlock -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 build/hyprlock -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
