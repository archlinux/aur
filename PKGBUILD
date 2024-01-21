# Maintainer: Jarno Malmari <jmalmari@ftml.net>

pkgname=orbuculum-git
pkgver=2.1.0.r95.ge312aa1
pkgrel=2
pkgdesc='Orbuculum is a set of tools for decoding and presenting output flows from the debug pins of a CORTEX-M CPU.'
arch=('x86_64')
url="https://github.com/orbcode/orbuculum"
license=('BSD-3-Clause')
groups=()
depends=('ncurses' 'sdl2' 'zeromq' 'capstone' 'libdwarf')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+${url}")
noextract=()
sha256sums=('SKIP')

prepare () {
    sed -i "s/subproject('libdwarf').*/dependency('libdwarf')/" "$srcdir/orbuculum/meson.build"
}

pkgver() {
    cd "$srcdir/orbuculum"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^V\(.*\)/\1/'
}

build() {
    cd "$srcdir"
    meson setup --prefix=/usr build orbuculum
    ninja -C build
}

package() {
    cd "$srcdir"
    meson install -C ./build --destdir ${pkgdir} --strip
}
