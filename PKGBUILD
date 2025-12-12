# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD 'forked' from electron*-bin [https://aur.archlinux.org/packages/electron40-bin] by
# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=libinput-nowacom-git
pkgver=1.30.0.r7.gdb6a0466
pkgrel=1
pkgdesc="Input device management and event handling library - compiled without support for wacom tablets"
url="https://gitlab.freedesktop.org/libinput/libinput"
arch=(x86_64)
license=(MIT)
depends=('mtdev' 'libevdev' 'glibc')
# upstream doesn't recommend building docs
makedepends=('git' 'gtk4' 'meson' 'wayland-protocols' 'check') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
checkdepends=('python-pytest')
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure'
            'python-yaml: used by various tools')
provides=(libinput)
conflicts=(libinput)
source=(git+https://gitlab.freedesktop.org/libinput/libinput)
sha256sums=('SKIP')

pkgver() {
  cd libinput
  git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson libinput build \
    -D udev-dir=/usr/lib/udev \
    -D documentation=false -D libwacom=false # -Db_lto=true -Db_lto_mode=thin -Dc_std=gnu2y -Dcpp_std=gnu++26

  # Print config
  meson configure build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dvm644 libinput/COPYING \
    "$pkgdir/usr/share/licenses/libinput/LICENSE"
}
