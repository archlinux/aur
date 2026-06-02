# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>
# Contributor: Amiel Kyamko <junkfactory@gmail.com>
pkgname=gnome-shell-extension-ddterm
pkgver=63.1.0
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
source=(
  "https://github.com/ddterm/${pkgname}/releases/download/v${pkgver}/ddterm-${pkgver}.tar.gz"
  https://github.com/ddterm/gnome-shell-extension-ddterm/commit/1065201c1ab15bb9ef58b525b915d8547acfca49.patch
)
sha256sums=('7431b03d33d274b5dd74eeb92c00038eb9d60a33d38fe2f480e7b660cd2419b2'
            '1bbaa8ce7e3709b06687ca7d16fb49d9b29471c4adf780c020c369e98e7ed848')

prepare() {
    cd "ddterm-${pkgver}"

    patch -p1 -i ../1065201c1ab15bb9ef58b525b915d8547acfca49.patch
}

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
