# Maintainer: Firefly Labs <fireflylabss@users.noreply.github.com>

pkgname=optionterm
pkgver=0.2.0
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
)
makedepends=(
  'cargo'
  'pkgconf'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '4a6822a073cded63f9799b56f6b058cfc36c9ae51351ead3b0d4b417a4421199'
)

_srcdir="optionTerm-$pkgver"

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
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
  install -Dm644 "packaging/io.option.terminal.desktop" \
    "$pkgdir/usr/share/applications/io.option.terminal.desktop"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 'NOTICE' "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 'CHANGELOG.md' "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
