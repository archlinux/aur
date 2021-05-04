# Maintainer: Davide Depau <davide@depau.eu>

pkgname=xdg-desktop-portal-wlr-git
pkgver=v0.3.0.r15.gefcbcb6
pkgrel=1
pkgdesc='xdg-desktop-portal backend for wlroots'
url=https://github.com/emersion/xdg-desktop-portal-wlr
arch=(x86_64)
license=(custom:MIT)
provides=("${pkgname%-git}" "xdg-desktop-portal-impl")
conflicts=("${pkgname%-git}")
depends=(xdg-desktop-portal pipewire libinih)
makedepends=(git meson wayland-protocols wayland scdoc)
optdepends=(
  "grim: required for the screenshot portal to function"
  "slurp: support for interactive mode for the screenshot portal; one of the built-in chooser options for the screencast portal"
  "bemenu: one of the built-in chooser options for the screencast portal"
  "wofi: one of the built-in chooser options for the screencast portal"
  "obs-xdg-portal: support for the screencast portal in obs"
)
source=(
  "${pkgname}::git+https://github.com/emersion/xdg-desktop-portal-wlr.git"
)
sha512sums=('SKIP')
options=(debug !strip)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
  msg2 "Note: this package, by default, creates a debug, non-stripped build to aid reporting bugs and development."
  msg2 "If you would like a smaller release build, please consider editing the PKGBUILD or using the non-git package."
	rm -rf build
	arch-meson "${pkgname}" build -Dsd-bus-provider=libsystemd
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}

