_pkgname=lsd
pkgname=lsd-nerdfonts
pkgver=0.18.0
pkgrel=1
pkgdesc='The next gen ls command'
arch=('x86_64')
url='https://github.com/Peltoche/lsd'
license=('Apache')
depends=('gcc-libs' 'ttf-nerd-fonts-symbols')
makedepends=('rust')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://github.com/Peltoche/lsd/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('11692c000c14fc220b22b4a40ff65f59c527283b8aef541836a5e115062292d5bf9a96488af92726ca1757c3877d10d82145a3ae1d6656560b8e4217b37b62d6')

build() {
  cd "$_pkgname-$pkgver"
  SHELL_COMPLETIONS_DIR=completions cargo build --release --locked
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md CHANGELOG.md     -t "$pkgdir/usr/share/doc/$pkgname/"

  # shell completions
  install -Dm644 completions/lsd.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 completions/lsd.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm644 completions/_lsd     "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
