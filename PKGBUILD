# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=squeekboard
pkgname=squeekboard-git
pkgver=1.43.0.r13.g27c359c4
pkgrel=1
pkgdesc='An on-screen-keyboard input method for Wayland'
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url='https://gitlab.gnome.org/World/Phosh/squeekboard'
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  feedbackd
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop
  gtk3
  libgcc
  libxkbcommon
  pango
  wayland
)
makedepends=(
  git
  glib2-devel
  libbsd
  meson
  python-gobject
  rust
  wayland-protocols
)
optdepends=('python-gobject: squeekboard-entry command')
conflicts=(squeekboard stevia)
provides=(squeekboard phosh-osk-provider)
source=("git+https://gitlab.gnome.org/World/Phosh/squeekboard.git"
        0002-Fix-build-with-Rust-1.98.0.patch)
b2sums=('SKIP'
        '7f1e9f3b89480a8ac4f5a46b452f536d58d03d11216fc04e1ddf7b61102283eff0abff837b3e2122240738ea674f93b3528cb492bfae24c20b6a49547d28a879')


pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd $_pkgname
  cargo fetch --locked --target "$(rustc --print host-tuple)"

  # Rust 1.98.0 and later lint invalid_runtime_symbol_definitions
  git apply -3 ../0002-Fix-build-with-Rust-1.98.0.patch
}

build() {
  arch-meson "$_pkgname" build --buildtype=release

  CARGO_PROFILE_RELEASE_LTO=true \
    CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 \
    CARGO_PROFILE_RELEASE_DEBUG=2 \
    CARGO_PROFILE_RELEASE_STRIP=false \
    CARGO_NET_OFFLINE=true \
    meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
