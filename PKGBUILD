# Maintainer: kpcyrd <git@rxv.cc>

pkgname=sn0int
pkgver=0.5.0
pkgrel=2
pkgdesc="OSINT framework and package manager"
url="https://github.com/kpcyrd/sn0int"
depends=('libcap' 'sqlite' 'libseccomp')
makedepends=('cargo' 'python-sphinx' 'make')
arch=('i686' 'x86_64')
license=('GPL3')
install='sn0int.install'
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('28538d6bb69cfd34e302058c61b030ad527cb76c9f7476344f5f8dd5b4c338c5')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
  make -C docs man
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -d "$pkgdir/usr/share/bash-completion/completions" \
             "$pkgdir/usr/share/zsh/site-functions" \
             "$pkgdir/usr/share/fish/vendor_completions.d"
  "$pkgdir/usr/bin/sn0int" completions bash > "$pkgdir/usr/share/bash-completion/completions/sn0int"
  "$pkgdir/usr/bin/sn0int" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_sn0int"
  "$pkgdir/usr/bin/sn0int" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/sn0int.fish"

  install -Dm644 docs/_build/man/sn0int.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
