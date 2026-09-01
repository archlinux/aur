# Maintainer: Noctalia Team <team@noctalia.dev>

pkgname=umbriel-git
pkgver=0.1.0.r0.0
pkgrel=6
pkgdesc='A Wayland compositor designed for daily use, with scrolling, dwindle, and master layouts, per-output workspaces, window rules, blur, shadows, and fluid animations'
arch=('x86_64' 'aarch64')
url='https://github.com/noctalia-dev/umbriel'
license=('MIT')
depends=(
  'cairo'
  'glibc'
  'jemalloc'
  'lcms2'
  'libdrm'
  'libglvnd'
  'libinput'
  'libxkbcommon'
  'pango'
  'pixman'
  'wayland'
  'xdg-desktop-portal-umbriel-git'
  'wlroots0.20'
)
makedepends=(
  'git'
  'mesa'
  'meson'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'tomlplusplus'
  'wayland-protocols'
)
optdepends=(
  'xwayland-satellite: X11 application support'
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
  meson setup "$srcdir/umbriel/build" "$srcdir/umbriel" \
    --buildtype=release \
    --prefix=/usr \
    --wrap-mode=nodownload \
    -Dtests=disabled
  meson compile -C "$srcdir/umbriel/build"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$srcdir/umbriel/build" --no-rebuild
  install -Dm644 "$srcdir/umbriel/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
