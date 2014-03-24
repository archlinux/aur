# Maintainer: Samuel Sloniker <sam@kj7rrv.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=libinput-no-gestures
provides=('libinput')
conflicts=('libinput')
pkgver=1.29.0
pkgrel=1
pkgdesc="Input device management and event handling library - patched to remove gestures"
url="https://gitlab.freedesktop.org/libinput/libinput"
arch=(x86_64)
license=(MIT)
depends=('mtdev' 'libevdev' 'libwacom' 'systemd-libs' 'glibc')
# upstream doesn't recommend building docs
makedepends=('gtk4' 'meson' 'wayland-protocols' 'check') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
checkdepends=('python-pytest')
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure'
            'python-yaml: used by various tools')
source=(https://gitlab.freedesktop.org/libinput/libinput/-/archive/$pkgver/libinput-$pkgver.tar.bz2)
sha256sums=('7160c16c409c9ea4f7da9d91923ae0a92df7f3453a292bf684bed071acd7b4ff')
#validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  # Patch out gestures; based on https://askubuntu.com/a/1234784
  sed -i 's/tp_gesture_are_gestures_enabled(tp)/false/g' libinput-$pkgver/src/evdev-mt-touchpad-gestures.c

  arch-meson libinput-$pkgver build \
    -D udev-dir=/usr/lib/udev \
    -D documentation=false

  # Print config
  meson configure build

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dvm644 libinput-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/libinput/LICENSE"
}
