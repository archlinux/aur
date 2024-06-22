# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Nikola Hadžić <nikola@firemail.cc>
pkgname=gst-plugins-rs
pkgver=1.24.5
pkgrel=1
pkgdesc="GStreamer plugins written in Rust"
arch=('x86_64')
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=('Apache-2.0 AND LGPL-2.1-or-later AND MIT AND MPL-2.0')
depends=(
  'cairo'
#  'dav1d'  ## requires <1.3
  'gst-plugins-base-libs'
  'gst-plugins-bad-libs'
  'graphene'
  'gstreamer'
  'gtk4'
  'libwebp'
  'libsodium'
  'openssl'
  'pango'
)
makedepends=(
  'cargo'
  'cargo-c'
  'clang'
  'git'
  'hotdoc'
  'meson'
  'nasm'
  'python-tomli'
)
provides=('gst-plugin-gtk4')
conflicts=('gst-plugin-gtk4')
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git#tag=gstreamer-$pkgver")
sha256sums=('641c094cac32ec751414bb3ac1bff3ba5aff4b6c9b34c11cc58530d3555aea17')

prepare() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname" build \
    -D sodium-source='system' \
    -D dav1d='disabled'
  meson compile -C build
}

check() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$pkgname"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
