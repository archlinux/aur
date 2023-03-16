# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=wl-mirror-git
pkgver=0.13.1.r0.g61816ff
pkgrel=1
pkgdesc="a simple Wayland output mirror client (git version)"
url="https://github.com/Ferdi265/wl-mirror"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("wl-mirror=${pkgver%%.r*}")
conflicts=('wl-mirror')
depends=('libglvnd' 'wayland')
makedepends=('git' 'cmake' 'ninja' 'scdoc')
optdepends=(
    'pipectl: named pipe manager, for wl-present script'
    'slurp: selecting regions and outputs, for wl-present script'
    'rofi: interactively selecting options, for wl-present script'
    'dmenu: interactively selecting options, alternative, for wl-present script'
)
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
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -G Ninja -B build -S "$srcdir/wl-mirror" \
        -DINSTALL_EXAMPLE_SCRIPTS=ON \
        -DINSTALL_DOCUMENTATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
