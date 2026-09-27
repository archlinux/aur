# Maintainer: Yangtse Su <yangtsesu@gmail.com>
pkgname=pixlay
pkgver=0.1.2
pkgrel=1
pkgdesc="Native Linux photo collage maker designed for GNOME."
# `aarch64` is the claim that this tree builds under Arch Linux ARM too, and that half of the
# package is built there: no GitHub runner has an aarch64 Arch userland. The release's arm64
# binaries are the runner's (`AGENTS.md`, "AUR discipline").
arch=('x86_64' 'aarch64')
url="https://github.com/YangtseSu/pixlay"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glycin')
makedepends=('cargo' 'rust' 'meson' 'gettext')
optdepends=('libheif: decode HEIC and AVIF photos')
# `updpkgsums` fills the checksum from the pushed `v$pkgver` tag, so it carries `SKIP` until that
# tag exists — and a tag that was re-pointed needs the cached `packaging/arch/*.tar.gz` deleted
# first, because `updpkgsums` reads the file already in `SRCDEST` and would print the old tag's
# sum (measured 2026-09-27). `.SRCINFO`, the AUR's own file, comes from `makepkg --printsrcinfo`.
source=("$pkgname-$pkgver.tar.gz::https://github.com/YangtseSu/pixlay/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0aa89d76242d2e151ac7bbc2b9ce9faab6d41c706d6acbf86650f6ed985e1c8d')

# `debug = 1` (Cargo.toml) writes the build path into every binary; the remap rewrites it
# to the directory the package itself has.
prepare() {
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=$srcdir=$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"

  # Vendored, so the build never reaches the network, and `CARGO_NET_OFFLINE` says so to
  # the cargo call meson makes.
  install -d .cargo
  cargo vendor --locked vendor > .cargo/config.toml

  export CARGO_NET_OFFLINE=true
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"

  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
