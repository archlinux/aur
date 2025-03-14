# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>
# Contributor: Amiel Kyamko <junkfactory@gmail.com>
pkgname=gnome-shell-extension-ddterm
pkgver=58
pkgrel=3
pkgdesc='Another Drop Down Terminal Extension for GNOME Shell'
arch=('any')
url='https://github.com/ddterm/gnome-shell-extension-ddterm'
license=('GPL-3.0-or-later')
depends=('gjs' 'gtk3')
_runtime_only_depends=('gnome-shell<=1:47.99' 'vte3' 'libhandy')
makedepends=('jq' 'meson' 'git' 'gtk4' 'libxslt' 'xorg-server-xvfb')
checkdepends=("${_runtime_only_depends[@]}" 'python-pytest' 'python-gobject' 'wl-clipboard')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ddterm/gnome-shell-extension-ddterm/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('ecc2745cf495174b690887fbd1ee4ed2d83719a6dbc13c21b01ff42346bab69a')

build() {
    arch-meson "${pkgname}-${pkgver}" build -Dlinters=disabled "-Dtests=$( ((CHECKFUNC)) && echo enabled || echo disabled )"

    # gtk-builder-tool needs X or Wayland
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run --auto-display --server-args=-noreset --wait=0 -- meson compile -C build

    local _max_gnome_shell_version
    _max_gnome_shell_version="$(jq -r '."shell-version" | max' build/metadata.json)"
    [[ "${_max_gnome_shell_version}" == *.* ]] || _max_gnome_shell_version="${_max_gnome_shell_version}.99"
    test "${_runtime_only_depends[0]}" = "gnome-shell<=1:${_max_gnome_shell_version}"
}

check() {
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run --auto-display --server-args=-noreset --wait=0 -- meson test -C build --print-errorlogs
}

package() {
    depends=("${_runtime_only_depends[@]}")

    meson install -C build --no-rebuild --destdir "${pkgdir}"
}
