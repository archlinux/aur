# Maintainer: Zhiyu Wang <zhiyuxl@outlook.com>
# Maintainer: LuoTianyi_arm64 <2153585992@qq.com>
# Contributor: Crush <crush@ccat.dev>

pkgname=ccat-rs
pkgver=0.3.4
pkgrel=1
pkgdesc="Universal file viewer — markdown, docx, images, PDF, audio, video, JSON, YAML, logs, ELF disasm, diff, gz, archives"
arch=('x86_64' 'aarch64')
url="https://github.com/zhiyuHD/ccat"
license=('MIT')
depends=('gcc-libs' 'oniguruma')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zhiyuHD/ccat/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('dd9de5252b6a64a7f3b5c931ace3943e8f7d5d5af792551f847bdada8b450d79')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_BUILD_JOBS=$(nproc)
  # Use system oniguruma instead of onig_sys building its own
  export RUSTONIG_SYSTEM_LIBONIG=1
  cargo build --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTONIG_SYSTEM_LIBONIG=1
  cargo test --release --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/ccat "$pkgdir/usr/bin/ccat"
  install -Dm644 completions/ccat.bash "$pkgdir/usr/share/bash-completion/completions/ccat"
  install -Dm644 completions/_ccat "$pkgdir/usr/share/zsh/site-functions/_ccat"
  install -Dm644 completions/ccat.fish "$pkgdir/usr/share/fish/vendor_completions.d/ccat.fish"
  install -Dm644 ccat.1 "$pkgdir/usr/share/man/man1/ccat.1"
}
