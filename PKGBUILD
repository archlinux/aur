# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=vector-slicer
pkgver=0.0.2
pkgrel=6
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
  appstream
  git
  meson
  rust
)
source=(
  "git+https://gitlab.gnome.org/World/design/vector-slicer.git#tag=v$pkgver"
  vector-slicer-fix-template.patch
  vector-slicer-appstreamcli.patch
  vector-slicer-desktop-categories.patch
  vector-slicer-prgname.patch
  vector-slicer-dbus-activatable.patch
)
b2sums=(
  72ae804ae8372efdcb0e612bbed79d87d8b05e45928bc81799eb62d3869e62349af565bff462204979e2c4e19d187db38a64442432a0601e759e9fcd396c7307
  3e8d5012f03cdc2137d5d1ecc089b37d8501414173f1e5548b70961b25b3e2d1544caab6d328b182855c4596261d8ddf19ca7621d7d9a591704f312057530927
  2d6a4d7d5adc4569a976be8a07974458f44b2533f42c86dc9af9d58684b8e59e2ea7bf500f220a38858d621075c8d01a64b5d7dff441a609756c8aa8fac61f43
  77335103e27ca3b2a1645a87f5040b05aa7781ff509d5e815395d40ab4d6d01b891c77a1d34a2e194716bfcc7cc382244f55826c012eb2c9048d113d618fca83
  a76fa7307fb6a1de9dbbb132b49a98450dbc2df3370d83a17961356f1c08d2b2c608af3ab035987c2943e4a138a6410128231526840aeefbd78ac68b73fdcbfa
  464fa0631037e962287f3aefff14816fc61a504de26365d4ea849bc00b8c1307ade2f169bb7da9242009081682aa39ef6eaca0fba53c1608b4e06bb7ba330e10
)

prepare() {
  cd $pkgname

  cargo update tendril

  CARGO_HOME="$srcdir/build/target/cargo-home" \
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # https://gitlab.gnome.org/World/design/vector-slicer/-/merge_requests/18
  git apply -3 ../vector-slicer-fix-template.patch

  # https://gitlab.gnome.org/World/design/vector-slicer/-/merge_requests/19
  git apply -3 ../vector-slicer-appstreamcli.patch

  # https://gitlab.gnome.org/World/design/vector-slicer/-/merge_requests/20
  git apply -3 ../vector-slicer-desktop-categories.patch

  # https://gitlab.gnome.org/World/design/vector-slicer/-/merge_requests/21
  git apply -3 ../vector-slicer-prgname.patch

  # https://gitlab.gnome.org/World/design/vector-slicer/-/merge_requests/22
  git apply -3 ../vector-slicer-dbus-activatable.patch
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
  install -Dm644 -t "$pkgdir/usr/share/$pkgname/" $pkgname/data/template.svg
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $pkgname/LICENSE.md
}
