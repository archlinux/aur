# Maintainer: Nikola Ivanovic <nikola@tehabstract.me>

pkgname=libinput-epp
pkgver=1.29.1
pkgrel=1
pkgdesc="Replaces Adaptive acceleration with Windows' Enhance Pointer Precision"
url="https://gitlab.freedesktop.org/tehabstract/libinput-epp"
arch=(x86_64)
license=(MIT)

depends=('mtdev' 'libevdev' 'libwacom' 'systemd-libs' 'glibc')
makedepends=('gtk4' 'meson' 'wayland-protocols' 'check')
checkdepends=('python-pytest')
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure'
            'python-yaml: used by various tools')

provides=("libinput=${pkgver}" 'libinput' 'libinput.so=10-64') # bump SONAME if upstream changes
conflicts=('libinput')

source=("libinput-epp-${pkgver}.tar.gz::https://gitlab.freedesktop.org/tehabstract/libinput-epp/-/archive/${pkgver}/libinput-epp-${pkgver}.tar.gz")
sha256sums=('5634b9d96db19a359560dd94e0bbd931030c9a526ce7299827b1ca7aa9ee9583')

build() {
  arch-meson "libinput-epp-${pkgver}" build \
    -D udev-dir=/usr/lib/udev \
    -D documentation=false

  meson configure --no-pager build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dvm644 "libinput-epp-${pkgver}/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

