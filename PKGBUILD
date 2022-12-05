# Maintainer: ThatOneCalculator <kainoa@t1c.dev>
# Based on the xdg-desktop-portal-wlr-git PKGBUILD

_pkgname="xdg-desktop-portal-hyprland"
pkgname="${_pkgname}-git"
pkgver=r224.3d3c5a4
pkgrel=2
pkgdesc="xdg-desktop-portal backend for hyprland"
url="https://github.com/hyprwm/xdg-desktop-portal-hyprland"
arch=(x86_64)
license=(custom:MIT)
provides=("${pkgname%-git}" "xdg-desktop-portal-impl")
conflicts=("${pkgname%-git}")
depends=(xdg-desktop-portal pipewire libinih qt6-base)
makedepends=(git meson wayland-protocols wayland scdoc cmake)
optdepends=(
  "grim: required for the screenshot portal to function"
  "slurp: support for interactive mode for the screenshot portal; one of the built-in chooser options for the screencast portal"
  "bemenu: one of the built-in chooser options for the screencast portal"
  "wofi: one of the built-in chooser options for the screencast portal"
  "obs-xdg-portal: support for the screencast portal in obs"
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

build() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init
	arch-meson build --prefix=/usr
	ninja -C build
	cd hyprland-share-picker && make all && cd ..
}

package() {
	cd "${srcdir}/${_pkgname}"
	sudo ninja -C build install
	install -Dm755 hyprland-share-picker/build/hyprland-share-picker -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
