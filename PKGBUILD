# Maintainer: ThatOneCalculator <kainoa@t1c.dev>
# Based on the xdg-desktop-portal-wlr-git PKGBUILD

_pkgname="xdg-desktop-portal-hyprland"
pkgname="${_pkgname}-git"
pkgver=1.3.1.r12.g1b713911
pkgrel=1
pkgdesc="xdg-desktop-portal backend for hyprland"
url="https://github.com/hyprwm/xdg-desktop-portal-hyprland"
arch=(x86_64)
license=(BSD)
provides=("${pkgname%-git}" "xdg-desktop-portal-impl" "xdg-desktop-portal-wlr")
conflicts=("${pkgname%-git}" "xdg-desktop-portal-wlr")
depends=("libpipewire" "libinih" "qt6-base" "qt6-wayland" "wayland" "sdbus-cpp" "libdrm" "xdg-desktop-portal" "mesa" "hyprlang>=0.2.0")
makedepends=("git" "wayland-protocols" "scdoc" "cmake")
optdepends=(
  "grim: required for the screenshot portal to function"
  "slurp: support for interactive mode for the screenshot portal; one of the built-in chooser options for the screencast portal"
  "hyprland: the Hyprland compositor"
)
source=("${_pkgname}::git+https://github.com/hyprwm/xdg-desktop-portal-hyprland.git")
sha256sums=('SKIP')

backup=("etc/xdg/xdg-desktop-portal/hyprland-portals.conf")

pkgver() {
	cd "${_pkgname}"
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
	  | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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
	cd "${srcdir}/${_pkgname}"
	cmake --install build

	# Remove ${pkgdir} from Exec paths
	sed -i -e "s|${pkgdir}||g" "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.hyprland.service"
	sed -i -e "s|${pkgdir}||g" "${pkgdir}/usr/lib/systemd/user/xdg-desktop-portal-hyprland.service"

	mkdir -p "${pkgdir}/etc/xdg/xdg-desktop-portal"
	# https://github.com/hyprwm/xdg-desktop-portal-hyprland/issues/171#issuecomment-1898969439
	echo -e "[preferred]\ndefault=gtk;hyprland" > "$pkgdir/etc/xdg/xdg-desktop-portal/hyprland-portals.conf"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
