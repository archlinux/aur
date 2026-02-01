# Contributor: Sven Fischer <aur.archlinux@linux4tw.de>

pkgname=read-it-later-git
_pkgname=read-it-later
pkgver=0.6.2.r8.g0a5277d
pkgrel=1
pkgdesc='A wallabag client GTK GUI'
arch=(x86_64 i686)
url='https://gitlab.gnome.org/World/read-it-later'
license=(GPL-3.0-or-later)
depends=(
  dconf
  gcc-libs
  glib2
  glibc
  gtk4
  hicolor-icon-theme
  libadwaita
  openssl
  sqlite
  webkitgtk-6.0
  zlib
)
makedepends=(
  appstream
  git
  meson
  rust
)
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(!lto)
source=(
  "git+https://gitlab.gnome.org/World/read-it-later.git"
  read-it-later-dbus-activatable.patch
)
b2sums=('SKIP'
        '41511c867a29a24b51937076c97d684fa284f1af7c3b76fd67a6c31b36009cc11612e87787a33d68734079a13b78098e4af4424c072ee2ef8d78be86f394f458')


pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  CARGO_HOME="$srcdir/build/cargo-home" \
    cargo fetch --locked --target "$(rustc --print host-tuple)"

  # https://gitlab.gnome.org/World/read-it-later/-/merge_requests/134
  git apply -3 ../read-it-later-dbus-activatable.patch
}

build() {
  arch-meson $_pkgname build

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
}
