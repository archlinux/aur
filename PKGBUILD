# Maintainer: Toorero <julius+git@jrueberg.de>

pkgname=gnome-webapps-git
pkgver=0.6.0.r0.g7482f2c
pkgrel=2
pkgdesc="Install websites as desktop applications on the GNOME desktop."
arch=("any")

url="https://codeberg.org/eyekay/webapps"
license=("GPL-3.0-or-later")

depends=(
    "python"
    "python-gobject"
    "gtk4"
    "dconf"
    "libadwaita"
    "libportal"
    "libportal-gtk4"
    "glib2"
    "gdk-pixbuf2"
    "libsoup3"
    "webkitgtk-6.0"
    "hicolor-icon-theme"
)
makedepends=(
    "meson"
    "git"
    "gtk-update-icon-cache"
    "desktop-file-utils"
    "blueprint-compiler"
    "appstream-glib"
)

conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=(
    "${pkgname%-git}::git+https://codeberg.org/eyekay/webapps.git"
    "fix-desktop-exec.patch"
)
sha256sums=(
    'SKIP'
    '92137185036f77bcaeccce2948b382843b1e6a7d0fe7ab583117db4520995da9'
)

prepare() {
    cd "${srcdir}/${pkgname%-git}"

    patch -Np1 -i "${srcdir}/fix-desktop-exec.patch"
}

build() {
    arch-meson ${pkgname%-git} build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"

    # fix permissions
    chmod 755 "$pkgdir/usr/bin/webapps"
}

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
