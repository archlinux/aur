# Maintainer:    Eric Engestrom <aur [at] engestrom [dot] ch>
# Co-Maintainer: Michael (https://aur.archlinux.org/account/michael_wzq)

pkgname=igt-gpu-tools
pkgver=1.30
pkgrel=1
pkgdesc="Collection of tools for development and testing of the DRM drivers."
url="https://gitlab.freedesktop.org/drm/igt-gpu-tools"
arch=(x86_64 aarch64)
license=(MIT)
makedepends=(
  meson
  ninja
)
depends=(
  alsa-lib
  bash
  cairo
  glib2
  glibc
  gsl
  gtk-doc
  json-c
  kmod
  libdrm
  libelf
  liboping
  libpciaccess
  libprocps
  libunwind
  libx11
  libxext
  libxmlrpc
  libxrandr
  libxv
  peg
  perl
  pixman
  procps-ng
  python
  python-docutils
  systemd-libs
  valgrind
  zlib
)
source=("$url/-/archive/v$pkgver/igt-gpu-tools-v$pkgver.tar.gz")
b2sums=('d917c69475a4fc723719feca7db4a93bb84c6a58f14ef2a6904b1dda699135bb7d4c69491bd1dd21a100dac5e2ad118d9baecedfca5d30fb3de5f8ae801310a1')

prepare() {
  MESON_OPTS=()
  if [ "$CARCH" != x86_64 ]
  then
    # overlay is x86-only
    MESON_OPTS+=(-D overlay=disabled)
  fi
  arch-meson "$pkgname-v$pkgver" build "${MESON_OPTS[@]}"
}

build() {
  ninja -C build
  ninja -C build igt-gpu-tools-doc
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "$pkgname-v$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
