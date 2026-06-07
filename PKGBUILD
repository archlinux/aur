# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>
# Contributor: Amiel Kyamko <junkfactory@gmail.com>
pkgname=gnome-shell-extension-ddterm
pkgver=63.1.1
pkgrel=1
pkgdesc='Another Drop Down Terminal Extension for GNOME Shell'
arch=('any')
url='https://github.com/ddterm/gnome-shell-extension-ddterm'
license=('GPL-3.0-or-later')
depends=('gjs' 'gtk3')
makedepends=('meson' 'git' 'libxslt')
checkdepends=('jq')
_max_gnome_shell_version=50
install="${pkgname}.install"
source=("https://github.com/ddterm/${pkgname}/releases/download/v${pkgver}/ddterm-${pkgver}.tar.gz")
sha256sums=('5719096dc897b13b87a8856b9452a75efbb8fe40918353867770773e7e7f97d2')

build() {
    local meson_options=(
        -Dtests=disabled
        -Dtests_x11=disabled
        -Dtests_wl_clipboard=disabled
    )

    arch-meson "ddterm-${pkgver}" build "${meson_options[@]}"

    meson compile -C build
}

check() {
    # Currently, GNOME Shell checks only the major part of the version when loading the extension
    test "$_max_gnome_shell_version" = "$(jq '."shell-version" | map(sub("\\D.*"; "") | tonumber) | max' build/metadata.json)"
}

package() {
    depends+=("gnome-shell<=1:${_max_gnome_shell_version}.99" 'vte3' 'libhandy')

    meson install -C build --no-rebuild --destdir "${pkgdir}"
}
