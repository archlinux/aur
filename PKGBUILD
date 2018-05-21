# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>
pkgname=graceful-shutdown
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminate a list of processes and wait for them to exit."
arch=('x86_64')
url="https://github.com/Mange/$pkgname"
license=('MIT')
depends=()
makedepends=('cargo')
source=("https://github.com/Mange/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('cca3f83499da0cbd6c9f9fd32723bc5fcfc402960201a8aa7ecb880dc8e2af45a403375ce8178cfade26c7b9136e125ed7e24b3a0b2f97add2959941a4001d69')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release

  # Generate completion scripts
  mkdir -p target/release/completions
  "./target/release/$pkgname" \
    --generate-completions bash > "target/release/completions/$pkgname.bash"
  "./target/release/$pkgname" \
    --generate-completions fish > "target/release/completions/$pkgname.fish"
  "./target/release/$pkgname" \
    --generate-completions zsh > "target/release/completions/_$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  local builddir=target/release

  install -Dm755 "$builddir/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$builddir/completions/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "$builddir/completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$builddir/completions/$pkgname.fish" "$pkgdir/usr/share/fish/completions/$pkgname.fish"

  install -Dm644 man/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

