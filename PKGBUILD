# newm - Wayland compositor
# Maintainer: Jonas Bucher <j.bucher.mn at gmail>

pkgname=newm-git
pkgver=0.2.r0.g5e4a171.27b399d
pkgrel=1
license=('MIT')
pkgdesc="Wayland compositor"
depends=(
    python3

    wayland
    libinput
    libxcb
    libxkbcommon
    opengl-driver
    pixman
    xcb-util-errors
    xcb-util-renderutil
    xcb-util-wm
    seatd
    xorg-xwayland

    python-evdev
    python-numpy
    python-imageio

    python-cairo
    python-psutil
    python-websockets
    python-pam
    python-pyfiglet
    python-fuzzywuzzy
)
makedepends=(
    git
    sed
    python3
    meson
    wayland-protocols
    xorgproto
)
arch=('any')
url="https://github.com/jbuchermn/newm"
source=(
	'git+https://github.com/jbuchermn/pywm.git'
	'git+https://github.com/jbuchermn/newm.git'
)
md5sums=(
	'SKIP'
	'SKIP'
)
provides=('newm')
conflicts=('newm')

pkgver() {
    cd $srcdir/newm
    newm_v=$(git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
    cd $srcdir/pywm
    pywm_v=$(git rev-parse --short HEAD)
    echo "$newm_v.$pywm_v"
}
prepare() {
    cd $srcdir/pywm
    git submodule init
    git submodule update
}
build() {
    cd $srcdir/pywm
    python3 setup.py build
    cd $srcdir/newm
    python3 setup.py build
}
package() {
    cd $srcdir/pywm
    python3 setup.py install --root="$pkgdir" --optimize=1
    cd $srcdir/newm
    python3 setup.py install --root="$pkgdir" --optimize=1
}
