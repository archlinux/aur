# Maintainer: smiley <smiley@archlinux.org>

_pkgname=hyprlogin
pkgname=hyprlogin-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Work-in-progress greetd greeter forked from hyprlock'
arch=('x86_64')
url='https://github.com/AuthenticSm1les/hyprlogin'
license=('BSD-3-Clause')
provides=('hyprlogin')
conflicts=('hyprlogin')
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
  'git'
  'hyprwayland-scanner'
  'pkgconf'
)
optdepends=(
  'greetd: login manager integration'
  'hyprland: greeter compositor session'
)
backup=('etc/hyprlogin/hyprlogin.conf')
options=(!debug)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf '0.0.0.r%s.%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  local staged_src="$srcdir/hyprlogin-src"
  local repo_src="$srcdir/$_pkgname"

  rm -rf "$staged_src"
  install -d "$staged_src"

  git -C "$repo_src" archive --format=tar HEAD | tar -xf - -C "$staged_src"
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
