# Maintainer: Hüseyn Teymurzade <https://github.com/Huseynteymurzade28>

pkgname=pomtex
pkgver=0.3.2
pkgrel=1
pkgdesc="On-demand LaTeX: a portable TeX kernel that installs CTAN packages only when a document needs them"
arch=('x86_64' 'aarch64')
url="https://github.com/Huseynteymurzade28/pomtex"
license=('MIT')
depends=('gc' 'pcre2' 'openssl' 'zlib' 'xz')
makedepends=('crystal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89e17b70290dc859d45dcb3324cb3f870876f4c54ead174d5730f58cc2b62f0d')

build() {
  cd "$pkgname-$pkgver"
  crystal build src/pomtex.cr -o pomtex --release --no-debug
  for shell in bash fish zsh; do ./pomtex completions "$shell" > "pomtex.$shell"; done
  ./pomtex manpage > pomtex.1
}

check() {
  cd "$pkgname-$pkgver"
  crystal spec
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 pomtex "$pkgdir/usr/bin/pomtex"
  install -Dm644 pomtex.bash "$pkgdir/usr/share/bash-completion/completions/pomtex"
  install -Dm644 pomtex.fish "$pkgdir/usr/share/fish/vendor_completions.d/pomtex.fish"
  install -Dm644 pomtex.zsh "$pkgdir/usr/share/zsh/site-functions/_pomtex"
  install -Dm644 pomtex.1 "$pkgdir/usr/share/man/man1/pomtex.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/"
}
