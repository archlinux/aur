# Maintainer: Hoream <hoream@qq.com>

_pkgname=warehouse
pkgname=warehouse-git
pkgver=2.2.0.r1.g007cd80
pkgrel=1
pkgdesc='A versatile toolbox for managing flatpak user data, viewing flatpak app info, and batch managing installed flatpaks.'
url="https://github.com/flattool/warehouse"
arch=('x86_64')
license=('GPL3')
depends=('flatpak-xdg-utils' 'gtk4' 'libadwaita' 'python-gobject')
makedepends=('appstream-glib' 'blueprint-compiler' 'cmake' 'git' 'meson' 'pkgconf')
source=("${_pkgname}::git+${url}")
sha1sums=('SKIP')

prepare() {
    cd $srcdir/${_pkgname}
    sed -i 's/os_string = GLib.get_os_info("NAME") + " " + GLib.get_os_info("VERSION")/os_string = GLib.get_os_info("NAME")/g' src/main.py
}

pkgver() {
    cd $srcdir/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/${_pkgname}
    meson --prefix /usr build
}

package() {
    cd $srcdir/${_pkgname}
    DESTDIR="$pkgdir" meson install -C build
    chmod +x ${pkgdir}/usr/bin/${_pkgname}
}
