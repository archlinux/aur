# Maintainer: Jasper van Bourgognie <louiecaulfield at gmail dot com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgname=libinput
pkgname="$_pkgname-three-finger-drag"
pkgver=1.28.1
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
        0001-gestures-fix-acceleration-in-3fg-drag.patch
        0002-enable-3fg-drag-by-default.patch
        )
b2sums=('SKIP'
        'ce6e69d41343dbbcee4757b174cf0fb9db6b2dd665a5b0ec248dbb5e76ac9afa38c599d65dc8e86f78475ec518c366a6358c2181a44e7fa629d28a62cf5db9b3'
        '3332b93d09da6d1c0150c365257aee1f6be7d4ce961849a312e62113ade3eda3c1b01e916e6482f1023641055af3899cab70dee431ca4b2c61ae5d35d4329918'
        )
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
    cd $_pkgname
    patch -Np1 -i "$srcdir/0001-gestures-fix-acceleration-in-3fg-drag.patch"
    patch -Np1 -i "$srcdir/0002-enable-3fg-drag-by-default.patch"
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
