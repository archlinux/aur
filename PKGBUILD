# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=dnglab
pkgver=0.8.0
pkgrel=1
pkgdesc="Camera RAW to DNG file format converter"
arch=(x86_64)
url=https://github.com/dnglab/dnglab
license=(LGPL-2.1-only)
depends=(glibc gcc-libs)
makedepends=(cargo)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('432b8ac8f553289e06c0d78b37ae6f9546e80b736ef879f2ee66b66345590c4d')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --all --release --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 target/release/dnglab "$pkgdir/usr/bin/dnglab"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" bin/dnglab/manpages/*.1

  install -Dm0644 bin/dnglab/completions/dnglab.bash \
    "$pkgdir/usr/share/bash-completion/completions/dnglab"
  install -Dm0644 bin/dnglab/completions/dnglab.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/dnglab.fish"
  install -Dm0644 bin/dnglab/completions/_dnglab \
    "$pkgdir/usr/share/zsh/site_functions/_dnglab"
}

# vim: set ts=2 sw=2 et:
