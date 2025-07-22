# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=tex-fmt
pkgver=0.5.5
pkgrel=1
pkgdesc="An extremely fast LaTeX formatter written in Rust"
arch=('x86_64')
url="https://github.com/WGUNDERWOOD/tex-fmt"
license=('MIT')
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('383c1620bf789945b04359127adb222118926eea7576910eb6779fb0dcdf9cdc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

  install -vDm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  "$pkgdir/usr/bin/$pkgname" --completion bash | install -Dm644 /dev/stdin  "${pkgdir}/usr/share/bash-completion/completions/$pkgname.bash"
  "$pkgdir/usr/bin/$pkgname" --completion fish | install -Dm644 /dev/stdin  "${pkgdir}/usr/share/fish/vendor_completions.d/$pkgname.fish"
  "$pkgdir/usr/bin/$pkgname" --completion zsh | install -Dm644 /dev/stdin  "${pkgdir}/usr/share/zsh/site-functions/_$pkgname"

}
