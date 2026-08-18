# Maintainer: Firefly Labs <fireflylabss@users.noreply.github.com>

pkgname=optionterm
pkgver=0.2.8
pkgrel=1
pkgdesc='Sidebar-first GTK4 terminal with tiling splits and Adwaita preferences'
arch=('x86_64')
url='https://github.com/fireflylabss/optionTerm'
license=('Apache-2.0')
# Renamed from option-term in 0.1.7; the old package must be replaced, not
# co-installed, since both own /usr/bin/option-term.
conflicts=('option-term')
replaces=('option-term')
provides=('option-term')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk4'
  'libadwaita'
  'cairo'
  'pango'
  'vte4'
  'webkitgtk-6.0'
)
makedepends=(
  'cargo'
  'pkgconf'
  'meson'
  'ninja'
  'curl'
  'git'
  'gdk-pixbuf2'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e42a9d7e416d6a833800101a20c9209d51bd668a6afa65ef7a9e19abecb6733a')

_srcdir="optionTerm-$pkgver"

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  # Build the patched VTE (kitty graphics protocol) before cargo fetch;
  # it installs into vte-dist/ and writes .cargo/config.toml.
  bash scripts/build-vte.sh
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$_srcdir"
  install -Dm755 "target/release/optionterm" "$pkgdir/usr/bin/optionterm"
  # The command was called option-term up to 0.1.6; keep it working.
  ln -s optionterm "$pkgdir/usr/bin/option-term"
  # Bundle the patched VTE (kitty graphics protocol). The binary's RUNPATH
  # searches $ORIGIN/../lib/optionterm, so this patched lib takes precedence
  # over the distro's stock libvte-2.91-gtk4.
  install -Dm755 "vte-dist/lib/libvte-2.91-gtk4.so.0" \
    "$pkgdir/usr/lib/optionterm/libvte-2.91-gtk4.so.0"
  ln -s libvte-2.91-gtk4.so.0 \
    "$pkgdir/usr/lib/optionterm/libvte-2.91-gtk4.so"
  install -Dm644 "packaging/io.option.terminal.desktop" \
    "$pkgdir/usr/share/applications/io.option.terminal.desktop"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 'NOTICE' "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 'CHANGELOG.md' "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
