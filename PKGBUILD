# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgbase=catwalk3d
pkgname=(catwalk3d catwalk3d-thumbnailer)
pkgver=2.4.2
pkgrel=2
pkgdesc="Headless 3D model thumbnails rendered on the CPU, entirely in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/cmeister2/catwalk3d"
license=('MIT')
makedepends=('cargo')
# makepkg's -flto turns the bundled zstd C objects into GCC bitcode that the
# Rust linker cannot resolve. Cargo still applies the crate's own thin LTO.
# Full debuginfo on the large generated CAD crates pushes rustc past 7 GB per
# job and gets parallel builds OOM-killed.
options=('!lto' '!debug')
# The crates.io tarball ships the Cargo.lock matching the upstream release.
source=("$pkgbase-$pkgver.tar.gz::https://static.crates.io/crates/$pkgbase/$pkgbase-$pkgver.crate"
        "catwalk3d.thumbnailer")
sha256sums=('a50dce4378f267a5407235ff648d8b4261ed4bb4e6a6e56ae6d979c5f6b95a2f'
            '08ce99bbe5e6cd70607d71d45a79c6d511cd4e5d9123b2dbd3d50e3634e637bd')

prepare() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin catwalk
}

check() {
  cd "$pkgbase-$pkgver"
  # The crate omits the upstream test fixtures, so smoke-test the bundled example.
  target/release/catwalk examples/models/gear.obj --output - --size 64 > /dev/null
}

package_catwalk3d() {
  depends=('glibc' 'gcc-libs')

  cd "$pkgbase-$pkgver"
  install -Dm755 target/release/catwalk "$pkgdir/usr/bin/catwalk"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_catwalk3d-thumbnailer() {
  pkgdesc="Desktop thumbnailer for STL, 3MF and STEP models using catwalk3d"
  arch=('any')
  depends=('catwalk3d')
  # Both register the same MIME types, so which one runs would be unpredictable.
  conflicts=('stl-thumb')

  install -Dm644 catwalk3d.thumbnailer "$pkgdir/usr/share/thumbnailers/catwalk3d.thumbnailer"
  install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
