# Maintainer: Gabriel <horizzon3507>
pkgname=optionsearch
pkgver=0.2.0
pkgrel=1
pkgdesc='Instant local-first file search for Linux (Option family)'
arch=('x86_64')
url='https://github.com/fireflylabss/optionSearch'
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'gtk4'
  'libadwaita'
)
makedepends=(
  'cargo'
)
optdepends=('poppler: PDF text previews via pdftotext')
provides=('needle' 'nld')
conflicts=('needle')
# Renamed from needle in 0.2.0; the old package must be replaced, not
# co-installed, since both own /usr/bin/needle.
replaces=('needle')
options=('!lto')
# Path dep: workspace expects ../optionSDK next to the extracted sources.
_optionsdk_ver=0.1.4
# Channeled release tag (Option mixed/stable). pkgver stays numeric for the AUR;
# the source archive points at the exact tag.
_tag=v0.2.0m-stable
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
  "optionSDK-$_optionsdk_ver.tar.gz::https://github.com/fireflylabss/optionSDK/archive/refs/tags/v$_optionsdk_ver.tar.gz"
)
sha256sums=(
  'cb651a9ef891933a9b8269698822534694e4988f85730db47c84c4193887b948'
  'fadd75e0c6ade33018fb741a2f7e395649fff2833f6d08dde5c42459c37012a7'
)

_srcdir="optionSearch-${_tag#v}"

prepare() {
  # Cargo.toml: optionSDK = { path = "../optionSDK", ... }
  ln -sfn "$srcdir/optionSDK-$_optionsdk_ver" "$srcdir/optionSDK"

  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p optionsearch-cli -p optionsearch-gui
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p optionsearch-core
}

package() {
  cd "$_srcdir"
  install -Dm755 target/release/optionsearch "$pkgdir/usr/bin/optionsearch"
  install -Dm755 target/release/optionsearch-gtk "$pkgdir/usr/bin/optionsearch-gtk"
  ln -s optionsearch "$pkgdir/usr/bin/nld"
  ln -s optionsearch-gtk "$pkgdir/usr/bin/needle"
  install -Dm644 "packaging/optionsearch.desktop" \
    "$pkgdir/usr/share/applications/io.option.search.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
