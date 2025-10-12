# Maintainer: Standa Lukeš <archpkg@exyi.cz>
pkgname=pg2parquet
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="Export PostgreSQL table or query into Parquet file"
arch=('x86_64')
url="https://github.com/exyi/pg2parquet"
license=('Apache')
groups=()
depends=(glibc gcc-libs openssl zstd)
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('fdf2b95ff024e038873662f24a5dad6be4ef39773411545d64dc9f50a1b9fbe65cf1d8e1c4285f8e3ffef3eff87e1c61b780f77a98feb5ab4a140f8b4132b9d9')
noextract=()

prepare() {
  cd "$srcdir/$pkgname-$pkgver/cli"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/cli"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS="${CFLAGS//-flto=auto/}" # hack to fix some weird linker error I don't understand
  env
  cargo build --frozen --release --all-features

  rm -rf manpage completions
  mkdir manpage
  mkdir completions
  target/release/$pkgname manpage-gen --out-manpage manpage --out-completion completions
  gzip -9 manpage/*
}

# check() {
#   cd "$srcdir/$pkgname-$pkgver"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "cli/target/release/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/share/man/man1/" cli/manpage/*
  install -Dm0644 cli/completions/complete.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm0644 cli/completions/complete.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -Dm0644 cli/completions/complete.zsh  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm0644 cli/completions/complete.nu   "$pkgdir/usr/share/nushell/vendor/autoload/$pkgname.nu"
  install -Dm0644 cli/completions/complete.elv  "$pkgdir/usr/share/elvish/lib/$pkgname.elv"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md

}

# vim:set ts=2 sw=2 et:
