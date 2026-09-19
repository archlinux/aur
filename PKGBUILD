# Maintainer: Dusan Borovcanin <borovcanindusan1@gmail.com>

# Built from the tagged source. `dbar-bin` repackages the same release's
# prebuilt binary for anyone who would rather not compile.
#
# pkgver and sha256sums are rewritten by scripts/aur-publish.sh when a tag is
# released, so the copy in the repository always describes a real release
# rather than a placeholder nobody can build.

pkgname=dbar
pkgver=0.9.3
pkgrel=1
pkgdesc="A small, event-driven Wayland status bar for Sway, SwayFX, niri and Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/dborovcanin/dbar"
license=('Apache-2.0')
# What the linker actually recorded: readelf -d names libpipewire, libgcc and
# libc, and nothing else. Wayland and xkbcommon are build-time probes - the
# Wayland protocol is spoken by dbar's own code rather than through libwayland.
# Exactly what readelf -d records, and no more: libpipewire-0.3.so, libgcc_s.so
# and libc. `gcc-libs` would name the same libgcc_s through a metapackage that
# also drags in libasan, libtsan, libobjc and libgfortran, none of which dbar
# links against.
depends=('glibc' 'libgcc' 'libpipewire')
makedepends=('cargo' 'clang' 'pkgconf' 'wayland' 'libxkbcommon')
optdepends=(
  'noto-fonts: the default font family and the Latin fallback'
  'noto-fonts-emoji: colour emoji in window titles and track names'
  'noto-fonts-cjk: Chinese, Japanese and Korean window titles'
  'ttf-nerd-fonts-symbols: Nerd Font glyphs in workspace names'
  'sway: one of the compositors dbar reads workspaces and window titles from'
  'niri: one of the compositors dbar reads workspaces and window titles from'
  'hyprland: one of the compositors dbar reads workspaces and window titles from'
)
# The release profile already strips, so there are no symbols to split out.
options=('!debug')
provides=("dbar=$pkgver")
conflicts=('dbar-bin' 'dbar-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('152b8e50f5bc12a07eca05e82cb411d1723c59564f3f3b029acabe06792f0150')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Vendor everything now so build() and check() can run with --frozen and
  # touch the network at no point after this.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The suite parses every shipped example and uses a stub text measurer, so it
  # needs neither a compositor nor this machine's hardware.
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 spec.md "$pkgdir/usr/share/doc/$pkgname/spec.md"
  # examples/config.toml is the compiled-in default; the rest are themes and
  # the two scripts the command examples point at.
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/examples" examples/*.toml
  install -Dm755 -t "$pkgdir/usr/share/doc/$pkgname/examples" examples/*.sh
}
