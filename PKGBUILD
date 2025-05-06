# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: ZhenDong Wu <wzd04062@sina.com>

pkgname=libfprint-cs9711-git
pkgver=1.94.6+31.r1672.20250105.03ace5b
pkgrel=1
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
provides=(libfprint libfprint-2.so libfprint-cs9711)
replaces=("libfprint-cs9711<=1.94.8")
conflicts=(libfprint)
groups=(fprint)
source=("git+https://github.com/ericlinagora/libfprint-CS9711")
b2sums=('SKIP')

pkgver() {
  cd "libfprint-CS9711"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

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
