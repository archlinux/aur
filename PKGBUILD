# Maintainer: Alexander Mezin <mezin.alexander at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=gnome-shell-extension-ddterm-git
pkgver=59.r13.ga51fda4f
pkgrel=1
pkgdesc="Another Drop Down Terminal Extension for GNOME Shell (Github version)."
arch=('any')
url='https://github.com/ddterm/gnome-shell-extension-ddterm'
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('gjs' 'gtk3')
makedepends=('jq' 'meson' 'git' 'gtk4' 'libxslt' 'xorg-server-xvfb')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "${pkgname%-git}" build -Dlinters=disabled -Dtests=disabled

    # gtk-builder-tool needs X or Wayland
    LIBGL_ALWAYS_SOFTWARE=1 xvfb-run --auto-display --server-args=-noreset --wait=0 -- meson compile -C build
}

package() {
    local _max_gnome_shell_version
    _max_gnome_shell_version="$(jq '."shell-version" | map(sub("\\D.*"; "") | tonumber) | max' build/metadata.json)"

    depends+=(
        "gnome-shell${_max_gnome_shell_version:+<=1:${_max_gnome_shell_version}.99}"
        'vte3'
        'libhandy'
    )

    meson install -C build --destdir "$pkgdir"
}

# vim:set ts=4 sw=4 et:
