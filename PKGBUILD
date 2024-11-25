# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=vector-slicer
pkgver=0.0.2
pkgrel=4
pkgdesc='Export multi-page PDFs from an SVG'
arch=(x86_64)
url='https://gitlab.gnome.org/World/design/vector-slicer'
license=(MIT)
depends=(
  cairo
  dconf
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libxml2
  pango
)
makedepends=(
  appstream-glib
  git
  meson
  rust
)
source=(
  "git+https://gitlab.gnome.org/World/design/vector-slicer.git#tag=v$pkgver"
  vector-slicer-desktop-categories.patch
)
b2sums=(
  72ae804ae8372efdcb0e612bbed79d87d8b05e45928bc81799eb62d3869e62349af565bff462204979e2c4e19d187db38a64442432a0601e759e9fcd396c7307
  77335103e27ca3b2a1645a87f5040b05aa7781ff509d5e815395d40ab4d6d01b891c77a1d34a2e194716bfcc7cc382244f55826c012eb2c9048d113d618fca83
)

prepare() {
  cd $pkgname

  cargo update tendril

  CARGO_HOME="$srcdir/build/target/cargo-home" \
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # https://gitlab.gnome.org/World/design/vector-slicer/-/merge_requests/20
  git apply -3 ../vector-slicer-desktop-categories.patch
}

build() {
  arch-meson $pkgname build

  CARGO_PROFILE_RELEASE_LTO=true \
    CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 \
    CARGO_PROFILE_RELEASE_DEBUG=2 \
    CARGO_PROFILE_RELEASE_STRIP=false \
    meson compile -C build
}

check() {
  meson test -C build --print-errorlogs --no-rebuild
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $pkgname/LICENSE.md
}
