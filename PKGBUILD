# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=wl-mirror-git
pkgver=0.1.1.r0.g58ce184
pkgrel=1
pkgdesc="a simple Wayland output mirror client (git version)"
url="https://github.com/Ferdi265/wl-mirror"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libglvnd' 'wayland')
makedepends=('git' 'cmake')
source=(
    "git+https://github.com/Ferdi265/wl-mirror"
    "git+https://gitlab.freedesktop.org/wayland/wayland-protocols"
    "git+https://gitlab.freedesktop.org/wlroots/wlr-protocols"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/wl-mirror"
    git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/wl-mirror"
    git submodule init
    git config submodule.proto/wayland-protocols.url "$srcdir/wayland-protocols"
    git config submodule.proto/wlr-protocols.url "$srcdir/wlr-protocols"
    git submodule update
}

build() {
    cmake -B build -S "$srcdir/wl-mirror" -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
