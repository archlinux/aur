# Maintainer: Ning Sun <n@sunng.info>
pkgname=tapgres
pkgver=0.3.0
pkgrel=1
pkgdesc="Passively tap a local PostgreSQL port and decode its wire traffic to stdout"
arch=('x86_64' 'aarch64')
url="https://github.com/sunng87/tapgres"
license=('MIT')
conflicts=('tapgres-bin')
provides=('tapgres')
depends=('gcc-libs' 'libpcap')
# `pandoc` is needed to render the man page's Markdown sections to ROFF (see
# examples/gen_manpage.rs). `cargo` builds both the binary and the gen_manpage
# example; the latter is run in package() to emit the manual page.
makedepends=('cargo' 'pandoc')
# The GitHub archive tarball extracts to tapgres-$pkgver/ (GitHub strips the
# leading "v" from the tag) and includes Cargo.lock, so --frozen is safe.
source=("$pkgname-$pkgver.tar.gz::https://github.com/sunng87/tapgres/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0d3ab463a4eb68abcbed1810522debfe56b71c5f05836157faf52658cbd8a43')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

# `ring` (pulled in by rustls/tokio-rustls) compiles C and assembly via its
# build script using the `cc` crate, which inherits CFLAGS/CXXFLAGS/CC from the
# environment. makepkg exports the system hardening flags *and* the user's
# toolchain (e.g. CC=clang) from /etc/makepkg.conf, and that combination can
# break ring's native code (undefined reference to `adx_bmi2_available`).
# Drop them so ring builds with the same clean toolchain as `cargo build`.
build() {
  cd "$pkgname-$pkgver"
  unset CC CXX CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  cargo build --frozen --release
  # Build the manpage generator (a dev-dep example) and run it to render the
  # manual page from the current CLI definition. clap_mangen/roff are fetched
  # by `cargo fetch --locked` in prepare().
  cargo build --frozen --release --example gen_manpage
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ./target/release/examples/gen_manpage "$pkgdir/usr/share/man/man1/tapgres.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
