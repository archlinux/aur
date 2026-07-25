# Maintainer: buffmio <laesunny@gmail.com>

pkgname=libfprint-fpc1022
pkgver=1.94.10.r2.gba10c93
pkgrel=1
pkgdesc='libfprint with experimental FPC1022/Disum 10a5:9200 support'
arch=('x86_64')
url='https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/570'
license=('LGPL-2.1-or-later')
groups=('fprint')
depends=(
  'glib2'
  'glibc'
  'libgcc'
  'libgudev'
  'libgusb'
  'libstdc++'
  'opencv'
  'openssl'
  'pixman'
)
makedepends=(
  'git'
  'glib2-devel'
  'gobject-introspection'
  'gtk-doc'
  'meson'
  'python-cairo'
  'python-gobject'
  'systemd'
)
checkdepends=('cairo' 'umockdev')
optdepends=('fprintd: D-Bus daemon and PAM module for fingerprint readers')
provides=('libfprint=1.94.10' 'libfprint-2.so')
conflicts=('libfprint')
_commit='ba10c9398fe4542ff6403549884d0c8687182845'
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
  arch-meson libfprint build \
    -D drivers=all \
    -D doc=true \
    -D installed-tests=false
  meson compile -C build
}

check() {
  # The metainfo validator performs a non-deterministic external URL check.
  # Run all local tests and the deterministic hwdb test separately.
  meson test -C build --print-errorlogs --no-suite libfprint:data
  meson test -C build --print-errorlogs udev-hwdb
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
