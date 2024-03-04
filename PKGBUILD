# Maintainer: WhitedonSAP <ayrtonarantes0987654321ayrt008 at gmail dot com>
# Thanks for yochananmarqos for improve this PKGBUILD

pkgname=warehouse
pkgver=1.4.0
pkgrel=1
pkgdesc="A versatile toolbox for managing flatpak user data, viewing flatpak app info, and batch managing installed flatpaks"
arch=('x86_64')
url="https://github.com/flattool/warehouse"
license=('GPL-3.0-or-later')
depends=('flatpak-xdg-utils' 'gtk4' 'libadwaita' 'python-gobject')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c9b25e72d9b46053e61681a2a332c9f734e1d00e3dd12e3af602beb4294b5c66')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i 's/os_string = GLib.get_os_info("NAME") + " " + GLib.get_os_info("VERSION")/os_string = GLib.get_os_info("NAME")/g' src/main.py
}

build() {
    arch-meson "${pkgname}-${pkgver}" build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs || :
}

package() {
    meson install -C build --destdir "${pkgdir}"

    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
