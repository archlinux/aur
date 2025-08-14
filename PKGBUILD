# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>
# Contributor: Amiel Kyamko <junkfactory@gmail.com>
pkgname=gnome-shell-extension-ddterm
pkgver=61
pkgrel=2
pkgdesc='Another Drop Down Terminal Extension for GNOME Shell'
arch=('any')
url='https://github.com/ddterm/gnome-shell-extension-ddterm'
license=('GPL-3.0-or-later')
depends=('gjs' 'gtk3')
makedepends=('meson' 'git' 'gtk4' 'libxslt' 'xorg-server-xvfb')
checkdepends=('jq')
_max_gnome_shell_version=48
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ddterm/gnome-shell-extension-ddterm/archive/refs/tags/v${pkgver}.tar.gz"
  'https://github.com/ddterm/gnome-shell-extension-ddterm/commit/e8d8f6b0d79082ed5e601af1b7beb0917fa44b52.patch'
  '0001-shell-wm-don-t-activate-hidden-window-on-X11-too.patch'
)
sha256sums=('6a4fab55c736a1297fa97926ebb274d8abd7d575c7c6b3489a988f7d6edde368'
            '93746c67ef893b0d5d5a6447318bdee4ec0d0bc1a4f3b207084465de1239ff6f'
            '2a95dd005e9b379a744d42ff66d1aec8ee71cfb9c2ef437a56014cddb651e2e0')

prepare() {
    cd "${pkgname}-${pkgver}"

    patch -p1 -i ../e8d8f6b0d79082ed5e601af1b7beb0917fa44b52.patch
    patch -p1 -i ../0001-shell-wm-don-t-activate-hidden-window-on-X11-too.patch
}

build() {
    arch-meson "${pkgname}-${pkgver}" build -Dtests=disabled

    # gtk-builder-tool needs X or Wayland
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run --auto-display --server-args=-noreset --wait=0 -- meson compile -C build
}

check() {
    # Currently, GNOME Shell checks only the major part of the version when loading the extension
    test "$_max_gnome_shell_version" = "$(jq '."shell-version" | map(sub("\\D.*"; "") | tonumber) | max' build/metadata.json)"
}

package() {
    depends+=("gnome-shell<=1:${_max_gnome_shell_version}.99" 'vte3' 'libhandy')

    meson install -C build --no-rebuild --destdir "${pkgdir}"
}
