# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=delineate
pkgver=0.1.0
pkgrel=1
pkgdesc='View and edit graphs'
arch=(x86_64)
url='https://github.com/SeaDve/Delineate'
license=(GPL-3.0-or-later)
depends=(
  graphene
  glib2
  gdk-pixbuf2
  gtk4
  gtksourceview5
  hicolor-icon-theme
  dconf
  glibc
  gcc-libs
  libadwaita
  webkitgtk-6.0
)
makedepends=(
  git
  meson
  rust
)
options=(!lto)
source=("git+https://github.com/SeaDve/Delineate.git#tag=v$pkgver")

prepare() {
  cd Delineate

  CARGO_HOME="$srcdir/build/cargo-home" \
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  arch-meson Delineate build

  CARGO_PROFILE_RELEASE_LTO=true \
    CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 \
    CARGO_PROFILE_RELEASE_DEBUG=2 \
    CARGO_PROFILE_RELEASE_STRIP=false \
    meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
sha256sums=('ea6af7ff4920c504edbe10ec91366fe46a74115583fcfac0e5b88718c88b4ca5')
