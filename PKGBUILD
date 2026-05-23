# Maintainer: smiley <smiley@archlinux.org>

pkgname=hyprlogin
pkgver=0.1.0
pkgrel=1
pkgdesc='Work-in-progress greetd greeter forked from hyprlock'
arch=('x86_64')
url='https://github.com/AuthenticSm1les/hyprlogin'
license=('BSD-3-Clause')
depends=(
  'cairo'
  'gcc-libs'
  'glibc'
  'hyprgraphics'
  'hyprlang'
  'hyprutils'
  'libdrm'
  'mesa'
  'pango'
  'pam'
  'sdbus-cpp'
  'wayland'
  'wayland-protocols'
  'libxkbcommon'
)
makedepends=(
  'cmake'
  'hyprwayland-scanner'
  'pkgconf'
)
optdepends=(
  'greetd: login manager integration'
  'hyprland: greeter compositor session'
)
backup=('etc/hyprlogin/hyprlogin.conf')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c5950f4e052efb7bf2b398d8b8454051d3068a192430e80918b21e7e405c147')

prepare() {
  local staged_src="$srcdir/hyprlogin-src"
  rm -rf "$staged_src"
  mkdir -p "$staged_src"
  tar -xf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$staged_src" --strip-components=1
}

build() {
  local staged_src="$srcdir/hyprlogin-src"
  local build_dir="$srcdir/hyprlogin-build"

  cmake -S "$staged_src" -B "$build_dir" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$build_dir" --target hyprlogin -j"$(nproc)"
}

package() {
  local staged_src="$srcdir/hyprlogin-src"
  local build_dir="$srcdir/hyprlogin-build"

  DESTDIR="$pkgdir" cmake --install "$build_dir"

  install -Dm644 "$staged_src/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$staged_src/assets/example.conf" \
    "$pkgdir/etc/hyprlogin/hyprlogin.conf"
}
