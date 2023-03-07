# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

_pkgname=igt-gpu-tools
pkgname=$_pkgname-git
pkgver=1.27.1+141.g3434cef8be
pkgrel=1
pkgdesc="Collection of tools for development and testing of the DRM drivers."
url="https://gitlab.freedesktop.org/drm/igt-gpu-tools"
arch=(x86_64 aarch64)
license=(custom)
makedepends=(
  git
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
  pixman
  procps-ng
  python-docutils
  systemd-libs
  valgrind
  zlib
)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$_pkgname" describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

prepare() {
  arch-meson "$_pkgname" build
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

  install -Dm644 "$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
