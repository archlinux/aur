# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phosh
pkgver=0.7.0
pkgrel=1
pkgdesc="A pure Wayland shell prototype for GNOME on mobile devices"
url="https://source.puri.sm/Librem5/phosh"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
depends=('feedbackd'
         'libhandy'
         'phoc')
makedepends=('ctags'
             'git'
             'meson'
             'vala')
# checkdepends=(xorg-server-xvfb)
source=("git+${url}.git#tag=v${pkgver}"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        "wlroots.patch::https://source.puri.sm/sebastian.krzyszkowiak/phosh/-/commit/87399f9e40c8475004924732432e677356edfa36.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd phosh

    git submodule init
    git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
    git submodule update
    
    patch src/home.c ../wlroots.patch
}

build() {
    arch-meson phosh build
    meson compile -C build
}

# check() {
#     dbus-run-session xvfb-run \
#         -s '-screen 0 1920x1080x24 -nolisten local' \
#         meson test -C build --print-errorlogs
# }

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
