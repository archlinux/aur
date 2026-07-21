# Contributor: Zach Leytus <22868934+zleytus@users.noreply.github.com>
# Maintainer: Zach Leytus <22868934+zleytus@users.noreply.github.com>

pkgname=kawaiifi-git
pkgver=0.1.0.r392.gc6f81ac
pkgrel=1
pkgdesc='Wi-Fi scanner and analyzer for Linux'
arch=('x86_64')
url='https://github.com/zleytus/kawaiifi'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'networkmanager'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'ninja'
  'pkgconf'
  'rust'
)
provides=('kawaiifi')
conflicts=('kawaiifi')
source=('git+https://github.com/zleytus/kawaiifi.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kawaiifi"

  local version
  version="$(sed -n "s/^project('kawaiifi', 'rust', version: '\([^']*\)'.*/\1/p" gui/meson.build)"

  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/kawaiifi/gui"

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --manifest-path Cargo.toml
}

build() {
  cd "$srcdir/kawaiifi/gui"

  export CARGO_HOME="$srcdir/cargo-home"
  arch-meson build -Dcargo-home="$CARGO_HOME"
  meson compile -C build
}

package() {
  cd "$srcdir/kawaiifi/gui"

  meson install -C build --destdir "$pkgdir"
}
