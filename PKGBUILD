# Maintainer: Nikola Ivanovic <nikola@tehabstract.me>

pkgbase=libinput-epp
pkgname=(
  libinput-epp
  libinput-epp-tools
)
pkgver=1.31.3
pkgrel=2
pkgdesc="Replaces Adaptive acceleration with Windows' Enhance Pointer Precision"
url="https://gitlab.freedesktop.org/tehabstract/libinput-epp"
arch=(x86_64)
license=(MIT)
depends=(
  glibc
  libevdev
  libgcc
  libwacom
  lua54
  mtdev
  systemd-libs
)
makedepends=(
  cairo
  check
  glib2
  gtk4
  libx11
  meson
  python
  python-libevdev
  python-pyudev
  python-yaml
  wayland
  wayland-protocols
)
checkdepends=(python-pytest)

source=("libinput-epp-${pkgver}.tar.gz::https://gitlab.freedesktop.org/tehabstract/libinput-epp/-/archive/${pkgver}/libinput-epp-${pkgver}.tar.gz")
sha256sums=('73e4f7430e97aff268980cb8d669b750e9cc2e2f4b863007a7e51af99e975b03')

build() {
  local meson_options=(
    # upstream recommends not building docs
    -D documentation=false
  )

  arch-meson "libinput-epp-${pkgver}" build "${meson_options[@]}"

  meson configure --no-pager build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_libinput-epp() {
  provides=("libinput=${pkgver}" 'libinput' 'libinput.so')
  conflicts=('libinput')
  optdepends=('libinput-epp-tools: debug utilities')

  meson install -C build --destdir "$pkgdir"

  (
    cd "$pkgdir"

    _pick tools usr/bin
    _pick tools usr/lib/libinput
    _pick tools usr/share/man
    _pick tools usr/share/zsh
  )

  install -Dm644 "libinput-epp-${pkgver}/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_libinput-epp-tools() {
  pkgdesc+=" (debug utilities)"
  depends=(
    cairo
    glib2
    glibc
    gtk4
    libevdev
    libgcc
    libinput-epp
    libx11
    python
    python-libevdev
    python-pyudev
    python-yaml
    systemd-libs
    wayland
  )
  provides=("libinput-tools=${pkgver}" 'libinput-tools')
  conflicts=('libinput-tools')

  mv tools/* "$pkgdir"

  install -Dm644 "libinput-epp-${pkgver}/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=-1 et:
