# Maintainer: DrPandemic <DrPandemic@users.noreply.github.com>
pkgname=irondict
pkgver=0.8.4
pkgrel=1
pkgdesc="Fast local multi-dictionary lookup with fuzzy headword search — CLI and GUI"
arch=('x86_64')
url="https://github.com/DrPandemic/irondict"
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=('glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'expat' 'zlib' 'bzip2' 'libpng' 'brotli')
optdepends=('albert: launcher integration ("d word" to search the dictionaries)')
source=("https://github.com/DrPandemic/irondict/archive/refs/tags/v${pkgver}.tar.gz"
        "v${pkgver}.tar.gz.asc::https://github.com/DrPandemic/irondict/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc")
sha256sums=('98a1a430f45e9be6d59874066d8601fdf8130a4be8afdfb2626757dc0641b94e' 'SKIP')
validpgpkeys=('E98D18E745656B40CDEE33BD9C53D2EE5DE74E65')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p irondict
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Single binary serves both front-ends: subcommands for the CLI, --gui for the GUI.
  install -Dm755 target/release/irondict "$pkgdir/usr/bin/irondict"

  install -Dm644 packaging/irondict.desktop \
    "$pkgdir/usr/share/applications/irondict.desktop"

  # Albert launcher plugin (optional; only loads when Albert + its Python plugin
  # are present). Trigger "d word" lists matches and opens them in the GUI.
  install -Dm644 packaging/albert/irondict/__init__.py \
    "$pkgdir/usr/share/albert/python/plugins/irondict/__init__.py"

  install -Dm644 crates/app/assets/icons/irondict.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/irondict.svg"

  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "crates/app/assets/icons/hicolor/${s}x${s}/apps/irondict.png" \
      "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/irondict.png"
  done

  install -Dm644 crates/core/assets/gcide/dictd_www.dict.org_gcide.ifo \
    "$pkgdir/usr/share/irondict/gcide/dictd_www.dict.org_gcide.ifo"
  install -Dm644 crates/core/assets/gcide/dictd_www.dict.org_gcide.idx \
    "$pkgdir/usr/share/irondict/gcide/dictd_www.dict.org_gcide.idx"
  install -Dm644 crates/core/assets/gcide/dictd_www.dict.org_gcide.dict.dz \
    "$pkgdir/usr/share/irondict/gcide/dictd_www.dict.org_gcide.dict.dz"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 docs/gcide.md "$pkgdir/usr/share/licenses/$pkgname/gcide.md"
}
