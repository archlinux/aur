# Maintainer: Nikola Ivanovic <nikola@tehabstract.me>

pkgname=libinput-epp
pkgver=1.29.2
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
sha256sums=('883f17dfb8692712f366b3c8fbddc3a1b26c89aeb834ad069b1873d34854741f')

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

