# Maintainer: Davide Depau <davide@depau.eu>

pkgname=xdg-desktop-portal-wlr-git
pkgver=v0.1.0.r1.ga105e0e
pkgrel=1
pkgdesc='xdg-desktop-portal backend for wlroots'
url=https://github.com/emersion/xdg-desktop-portal-wlr
arch=(x86_64)
license=(custom:MIT)
provides=("${pkgname%-git}" "xdg-desktop-portal-impl")
conflicts=("${pkgname%-git}")
depends=(xdg-desktop-portal pipewire)
makedepends=(git meson wayland-protocols wayland)
optdepends=(
  "libpipewire02: For Chromium WebRTC desktop screencast (see project GitHub page)"
  "obs-xdg-portal: OBS Studio plugin for XDG Desktop Portal (or wlrobs for direct wlroots integration)"
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
	arch-meson "${pkgname}" build
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}

