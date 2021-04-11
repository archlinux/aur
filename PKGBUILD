# Maintainer: lmartinez-mirror
pkgbase=sniprun-legacy
pkgname=('sniprun-legacy' 'neovim-sniprun-legacy')
_name="${pkgbase%-legacy}"
pkgver=0.4.9
pkgrel=1
pkgdesc='A neovim plugin to independently run snippets of code (for neovim < 0.5)'
arch=('x86_64')
url="https://github.com/michaelb/sniprun"
license=('MIT')
makedepends=('cargo' 'gcc-libs')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('48b5f59829edfcfb6cf81f15b44bbc9dd0cbe92aa76a5cbce93534623e26735c')

prepare() {
  test -d "$pkgbase-$pkgver" || mv "$_name-$pkgver" "$pkgbase-$pkgver"
}

build() {
  cd "$pkgbase-$pkgver"
  cargo build --release --all-features --target-dir=target
}

# check() {
#   cd "$pkgname-$pkgver"
#   cargo test --release --locked --target-dir=target
# }

package_sniprun-legacy() {
  pkgdesc='Compiled binary core for neovim-sniprun-legacy'
  depends=('gcc-libs')
  provides=("${pkgname%-legacy}=$pkgver")
  conflicts=("${pkgname%-legacy}")

  cd "$pkgbase-$pkgver"
  install -Dm 755 target/release/sniprun -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-sniprun-legacy()  {
  arch=('any')
  depends=('neovim<0.5' "sniprun=$pkgver")
  optdepends=('bash: Bash snippet support'
              'gcc: C/C++ snippets support'
              'gcc-ada: Limited Ada snippet support'
              'ghc: Haskell snippets support'
              'python3: Python3 snippets support'
              'jupyter: Jupyter support')
  provides=("${pkgname%-legacy}=$pkgver")
  conflicts=("${pkgname%-legacy}")
  install="$pkgname.install"

  cd "$pkgbase-$pkgver"
  find autoload doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -d "$pkgdir/usr/share/nvim/runtime/target/release"
  ln -s "/usr/bin/sniprun" "$pkgdir/usr/share/nvim/runtime/target/release/sniprun"
  install -d "$pkgdir/usr/share/licenses/"
  install -d "$pkgdir/usr/share/doc/"
  ln -s "/usr/share/licenses/$pkgbase/" "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/share/doc/$pkgbase/" "$pkgdir/usr/share/doc/$pkgname"
}
