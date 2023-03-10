# Maintainer: Jonas Møller <jonas.moeller2@protonmail.com>
pkgname=hawck-git
_pkgname=Hawck
pkgver=20230310
pkgrel=1
pkgdesc="Keyboard macro system"
arch=("x86_64")
url="https://github.com/snyball/hawck"
license=('BSD')
depends=("libnotify" "lua53" "ruby" "python" "kbd" "hicolor-icon-theme")
makedepends=("meson" "gcc" "pkg-config" "catch2" "ninja" "git")
optdepends=("doxygen" "zenity" "polkit-gnome")
install=$pkgname.install
source=("git+https://github.com/snyball/hawck.git")
md5sums=("SKIP")

pkgver() {
    cd $_pkgname
    TZ=UTC date -d @$(git log -1 --format=%ct) +%Y%m%d
}

prepare() {
    cd "$_pkgname"
}

build() {
    cd "$_pkgname"
    [ -d build ] || mkdir build
    cd build
    meson ..
    meson configure -Dprefix=/usr
    meson configure -Dcpp_args=-O2
    ninja -j8
}

package() {
    cd "$_pkgname/build"
    DESTDIR="$(realpath "$pkgdir")" ninja install
}
