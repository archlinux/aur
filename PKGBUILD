# Maintainer: Jasper van Bourgognie <louiecaulfield at gmail dot com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgname=libinput
pkgname="$_pkgname-three-finger-drag"
pkgver=1.29.2
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://gitlab.freedesktop.org/libinput/libinput"
arch=(x86_64)
license=(MIT)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('mtdev' 'libevdev' 'libwacom' 'systemd-libs' 'glibc')
# upstream doesn't recommend building docs
makedepends=('gtk4' 'meson' 'wayland-protocols' 'check') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
checkdepends=('python-pytest')
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure'
            'python-yaml: used by various tools')
source=("git+https://gitlab.freedesktop.org/$_pkgname/$_pkgname.git?signed#tag=$pkgver"
        0001-enable-3fg-drag-by-default.patch
        )
b2sums=('SKIP'
        'a1bab152c9ff05b84410be92736c7f73352dc56149d71b240d6983b799fb9c211f00037511f829fc175b632004550947ece607f73915376d08de19d7041a4bdb'
        )
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
    cd $_pkgname
    patch -Np1 -i "$srcdir/0001-enable-3fg-drag-by-default.patch"
}

build() {
    arch-meson $_pkgname build \
        -D udev-dir=/usr/lib/udev \
        -D documentation=false
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dvm644 $_pkgname/COPYING     "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
