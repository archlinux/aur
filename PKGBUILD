# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>
pkgname=tydra
pkgver=1.0.3
pkgrel=1
pkgdesc="Shortcut menu-based task runner, inspired by Emacs Hydra"
arch=('x86_64')
url="https://github.com/Mange/$pkgname"
license=('MIT')
depends=()
makedepends=('cargo')
source=("https://github.com/Mange/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f1c91962f7a77c39ac3a8199e1c9c8ee5f7c328e16ab7dfeeb88f4494aaafb61ab019e20be7bda12b39439542208d84658d0e977fd08dfe0ea0833f60482a072')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release

  # Generate completion scripts
  mkdir -p target/release/completions
  "./target/release/$pkgname" \
    --generate-completions bash >"target/release/completions/$pkgname.bash"
  "./target/release/$pkgname" \
    --generate-completions fish >"target/release/completions/$pkgname.fish"
  "./target/release/$pkgname" \
    --generate-completions zsh >"target/release/completions/_$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  local builddir=target/release
  local readme_path="$pkgdir/usr/share/doc/${pkgname}/README.md"

  install -Dm755 "$builddir/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$builddir/completions/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "$builddir/completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$builddir/completions/$pkgname.fish" "$pkgdir/usr/share/fish/completions/$pkgname.fish"

  install -Dm755 -d "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/man/man5"
  install -Dm644 doc/*.1 "$pkgdir/usr/share/man/man1/"
  install -Dm644 doc/*.5 "$pkgdir/usr/share/man/man5/"

  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}/examples"

  install -Dm644 "README.md" "$readme_path"
  install -Dm644 doc/examples/* "$pkgdir/usr/share/doc/${pkgname}/examples"
  install -Dm644 doc/*.md "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm644 doc/*.png "$pkgdir/usr/share/doc/${pkgname}"

  # Since README and doc/ files are flattened, remove the "doc/" prefix inside the README.md.
  sed 's#doc/##g' "$readme_path" >"$readme_path.new"
  mv "$readme_path.new" "$readme_path"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
