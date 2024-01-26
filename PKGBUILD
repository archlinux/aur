# Maintainer: ThatOneCalculator <kainoa@t1c.dev>
# Based on the xdg-desktop-portal-wlr-git PKGBUILD

_pkgname="xdg-desktop-portal-hyprland"
pkgname="${_pkgname}-git"
pkgver=r359.5a59264
pkgrel=1
epoch=1
pkgdesc="xdg-desktop-portal backend for hyprland"
url="https://github.com/hyprwm/xdg-desktop-portal-hyprland"
arch=(x86_64)
license=(BSD)
provides=("${pkgname%-git}" "xdg-desktop-portal-impl" "xdg-desktop-portal-wlr")
conflicts=("${pkgname%-git}" "xdg-desktop-portal-wlr")
depends=(pipewire libinih qt6-base qt6-wayland sdbus-cpp hyprlang)
makedepends=(git meson wayland-protocols wayland scdoc cmake)
optdepends=(
  "grim: required for the screenshot portal to function"
  "slurp: support for interactive mode for the screenshot portal; one of the built-in chooser options for the screencast portal"
  "bemenu: one of the built-in chooser options for the screencast portal"
  "wofi: one of the built-in chooser options for the screencast portal"
  "hyprland: the Hyprland compositor"
)
source=("${_pkgname}::git+https://github.com/hyprwm/xdg-desktop-portal-hyprland.git")
sha256sums=('SKIP')
options=(!makeflags !buildflags !strip)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --no-warn-unused-cli -DCMAKE_INSTALL_LIBEXECDIR:STRING=${pkgdir}/usr/lib -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" -S . -B ./build
	cmake --build ./build --config Release --target all
}

package() {
  depends=(xdg-desktop-portal)
	cd "${srcdir}/${_pkgname}"
	cmake --install build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
