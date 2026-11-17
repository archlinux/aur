# Maintainer: Noctalia Team <team@noctalia.dev>

pkgname=xdg-desktop-portal-umbriel-git
pkgver=0.1.0.r0.0
pkgrel=4
pkgdesc='xdg-desktop-portal backend for the Umbriel compositor'
arch=('x86_64' 'aarch64')
url='https://github.com/noctalia-dev/xdg-desktop-portal-umbriel'
license=('MIT')
depends=(
  'cairo'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'harfbuzz'
  'libdrm'
  'libglvnd'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'pango'
  'sdbus-cpp'
  'tomlplusplus'
  'wayland'
  'xdg-desktop-portal'
)
makedepends=(
  'git'
  'libei>=1.3'
  'meson'
  'ninja'
  'nlohmann-json'
  'pkgconf'
  'stb'
  'wayland-protocols'
)
optdepends=(
  'slurp: color picking'
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
  arch-meson "$srcdir/xdg-desktop-portal-umbriel" \
    "$srcdir/xdg-desktop-portal-umbriel/build" \
    -Db_ndebug=true \
    -Dpicker=true
  meson compile -C "$srcdir/xdg-desktop-portal-umbriel/build"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$srcdir/xdg-desktop-portal-umbriel/build"
  install -Dm644 "$srcdir/xdg-desktop-portal-umbriel/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
