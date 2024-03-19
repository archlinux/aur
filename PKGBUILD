# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=igt-gpu-tools
pkgver=1.28
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
  alsa-lib
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
  libprocps
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
sha256sums=('ba15b321c5a90da629baf326912c9c0406a903719040eb4959e0af1197935133')

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
  ninja -C build igt-gpu-tools-doc
}

# several tests are timing out
# false &&
check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "$pkgname-v$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
