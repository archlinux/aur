# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=igt-gpu-tools
pkgver=1.27.1
pkgrel=1
pkgdesc="Collection of tools for development and testing of the DRM drivers."
url="https://gitlab.freedesktop.org/drm/igt-gpu-tools"
arch=(x86_64 aarch64)
license=(custom)
makedepends=(
  meson
  ninja
)
depends=(
  cairo
  glib2
  gsl
  gtk-doc
  json-c
  kmod
  libdrm
  libelf
  liboping
  libpciaccess
  libunwind
  libxmlrpc
  libxrandr
  libxv
  peg
  pixman
  procps-ng
  python-docutils
  systemd-libs
  valgrind
  zlib
)
source=("$url/-/archive/v$pkgver/igt-gpu-tools-v$pkgver.tar.gz")
sha256sums=('d6f6c26a86d95a74c20b911ded81ebfa8b0702a2786886b32e8aa891e703e4c1')

prepare() {
  MESON_OPTS=()
  if [ $CARCH != x86_64 ]
  then
    # overlay is x86-only
    MESON_OPTS+=(-D overlay=disabled)
  fi
  arch-meson "$pkgname-v$pkgver" build "${MESON_OPTS[@]}"
}

build() {
  ninja -C build
}

# several tests are timing out
false &&
check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "$pkgname-v$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
