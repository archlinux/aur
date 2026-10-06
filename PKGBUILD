# Maintainer: Noctalia Team <team@noctalia.dev>

pkgname=umbriel-git
pkgver=0.1.0.r0.0
pkgrel=9
pkgdesc='A Wayland compositor designed for daily use, with scrolling, dwindle, and master layouts, per-output workspaces, window rules, blur, shadows, and fluid animations'
arch=('x86_64' 'aarch64')
url='https://github.com/noctalia-dev/umbriel'
license=('MIT')
depends=(
  'cairo'
  'gcc-libs'
  'glibc'
  'jemalloc'
  'lcms2'
  'libdrm'
  'libdisplay-info'
  'libglvnd'
  'libinput'
  'libxcb'
  'libxkbcommon'
  'mesa'
  'pango'
  'pixman'
  'systemd-libs'
  'tomlplusplus'
  'wayland'
  'xcb-util-wm'
  'xorg-xwayland'
  'xdg-desktop-portal-umbriel-git'
  'wlroots0.20>=0.20.1'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'wayland-protocols'
)
provides=('umbriel')
conflicts=('umbriel')
source=('git+https://github.com/noctalia-dev/umbriel.git#branch=main')
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/umbriel"
  local version
  version=$(sed -n "s/^[[:space:]]*version: '\([^']*\)'.*/\1/p" meson.build)
  printf '%s.r%s.%s' \
    "$version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "$srcdir/umbriel" "$srcdir/umbriel/build" \
    -Db_ndebug=true \
    -Dtests=disabled \
    -Dtest_ipc=disabled
  meson compile -C "$srcdir/umbriel/build"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$srcdir/umbriel/build" --no-rebuild
  install -Dm644 "$srcdir/umbriel/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
