# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: ZhenDong Wu <wzd04062@sina.com>

pkgname=libfprint-cs9711
pkgver=1.94.8
pkgrel=3
pkgdesc="libfprint with proprietary FPC match on host device CS9711Fingprint driver"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  libgudev
  libgusb
  nss
  pixman
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-cairo
  python-gobject
  systemd
  opencv
  cmake
)
checkdepends=(
  cairo
  umockdev
  doctest
)
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://github.com/ericlinagora/libfprint-CS9711")
b2sums=('SKIP')

prepare() {
  cd libfprint-CS9711
  sed -i 's|import shutil|import shutil\n    import traceback|g' tests/virtual-image.py
}

build() {
  local meson_options=(
    # Add virtual drivers for integration tests (e.g. in fprintd)
    -D drivers=all

    -D installed-tests=false
  )

  arch-meson libfprint-CS9711 build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
