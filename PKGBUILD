# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=newscheck
pkgver=0.2.3
pkgrel=1
pkgdesc="Yet another Arch Linux news reader"
url="https://github.com/xuanruiqi/newscheck"
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuanruiqi/newscheck/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bea50cf2d3261613bf9bfd57592fc2c41cf432ca2570888120ff96a19c21c0f9')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
makedepends=('cargo' 'pandoc')
install=newscheck.install

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --frozen --release --target-dir target
  pandoc man.md -s -t man -o man.1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/newscheck "$pkgdir/usr/bin/newscheck"

  # Generate completion files.
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir"/usr/bin/newscheck completions bash > "$pkgdir/usr/share/bash-completion/completions/newscheck"
  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
  "$pkgdir"/usr/bin/newscheck completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/newscheck.fish"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir"/usr/bin/newscheck completions zsh > "$pkgdir/usr/share/zsh/site-functions/_newscheck"

  install -Dm644 $pkgname.hook "$pkgdir/usr/share/libalpm/hooks/00-$pkgname.hook"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 man.1 "$pkgdir/usr/share/man/man1/newscheck.1"
}
