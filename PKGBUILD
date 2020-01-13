# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phosh-git
pkgver=0.1.7.r0.g20ea13b
pkgrel=1
pkgdesc="A pure Wayland shell prototype for GNOME on mobile devices"
url="https://source.puri.sm/Librem5/phosh"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h)
depends=(gcr
         libhandy
         libnm
         libsecret
         phoc
         upower
         virtboard)
makedepends=(ctags
             git
             meson
             vala)
provides=(phosh)
conflicts=(phosh)
source=("git+https://source.puri.sm/Librem5/phosh.git"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=("SKIP"
            "SKIP")

pkgver() {
    cd phosh
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd phosh

    git submodule init
    git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
    git submodule update
}

build() {
    arch-meson phosh build
    ninja -C build
}

# check() {
#     ninja -C build test
# }

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
