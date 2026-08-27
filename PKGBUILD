# Maintainer: Noctalia Team <team@noctalia.dev>

pkgname=xdg-desktop-portal-umbriel-git
pkgver=0.1.0.r0.0
pkgrel=1
pkgdesc='xdg-desktop-portal backend for the Umbriel compositor'
arch=('x86_64' 'aarch64')
url='https://github.com/noctalia-dev/xdg-desktop-portal-umbriel'
license=('MIT')
depends=(
  'cairo'
  'egl-gbm'
  'glibc'
  'gtk4'
  'libdrm'
  'libpipewire'
  'sdbus-cpp'
  'wayland'
  'xdg-desktop-portal'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'tomlplusplus'
  'wayland-protocols'
)
provides=('xdg-desktop-portal-umbriel')
conflicts=('xdg-desktop-portal-umbriel')
source=('git+https://github.com/noctalia-dev/xdg-desktop-portal-umbriel.git#branch=main')
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/xdg-desktop-portal-umbriel"
  local version
  version=$(sed -n "s/^[[:space:]]*version: '\([^']*\)'.*/\1/p" meson.build)
  printf '%s.r%s.%s' \
    "$version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  meson setup "$srcdir/xdg-desktop-portal-umbriel/build" \
    "$srcdir/xdg-desktop-portal-umbriel" \
    --buildtype=release \
    --prefix=/usr \
    --libexecdir=lib \
    --wrap-mode=nodownload
  meson compile -C "$srcdir/xdg-desktop-portal-umbriel/build"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$srcdir/xdg-desktop-portal-umbriel/build"
  install -Dm644 "$srcdir/xdg-desktop-portal-umbriel/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
