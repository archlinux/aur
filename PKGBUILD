

pkgname=jaq-git
pkgver=3.1.1.40.g6b8cbeb7
pkgver() {
  cd jaq
  git describe --long --tags | sed -e "s/v//" -e 's/-alpha-/.r/' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc='A jq clone'
url=https://github.com/01mf02/jaq
arch=('x86_64')
license=(MIT)
depends=(gcc-libs glibc mimalloc)
makedepends=(rust jotdown)
conflicts=(jaq jq)
provides=(jaq jq)
source=("git+${url}.git")
b2sums=('SKIP')

prepare() {
  cd jaq
  mkdir -p .cargo
  cat << 'EOF' > .cargo/config.toml
[target.x86_64-unknown-linux-gnu.mimalloc]
rustc-link-lib = ["mimalloc"]
rustc-link-search = ["/usr/lib"]
EOF
}

build() {
  cd jaq
  test $RUSTC_BOOTSTRAP = 1 && test -e /usr/lib/rustlib/src/rust/library/Cargo.toml && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  RUSTFLAGS+=" -C force-unwind-tables=no"
  cargo build --release $_cargoflags
  make -C docs jaq.1
}

package() {
  unset optdepends
  cd jaq
  install -Dm 755 target/release/jaq -t "$pkgdir"/usr/bin
  install -Dm 755 docs/jaq.1 -t "$pkgdir"/usr/share/man/man1
  ln -sf jaq "$pkgdir"/usr/bin/jq
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
