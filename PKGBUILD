# Maintainer: Xubai Wang <18016038327@189.cn>

pkgname=deno-canary-bin
_pkgname=deno
pkgrel=1
pkgdesc='A secure runtime for JavaScript and TypeScript, Canary build'
pkgver=2.3.7.ec32c6e5
arch=('x86_64' 'aarch64')
url='https://dl.deno.land/'
provides=('deno')
conflicts=('deno')
license=('MIT')
makedepends=('curl' 'unzip')

source=(
  'https://dl.deno.land/release-latest.txt'
  "canary-latest.txt::https://dl.deno.land/canary-$arch-unknown-linux-gnu-latest.txt"
  'https://raw.githubusercontent.com/denoland/deno/refs/heads/main/LICENSE.md'
)
noextract=(
  "release-latest.txt"
  "canary-latest.txt"
  "LICENSE.md"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  release=$(cat release-latest.txt | cut -c2-)
  hash=$(cat canary-latest.txt | cut -c1-8)
  printf "$release.$hash"
}

prepare() {
  hash=$(cat canary-latest.txt)
  echo "hash=$hash"
  curl -o deno.zip "https://dl.deno.land/canary/$hash/deno-$arch-unknown-linux-gnu.zip"
  unzip deno.zip
}

package() {
  install -Dm755 deno "$pkgdir"/usr/bin/deno
  install -dm755 "$pkgdir"/usr/share/bash-completion/completions
  ./deno completions bash > "$pkgdir"/usr/share/bash-completion/completions/deno
  install -dm755 "$pkgdir"/usr/share/zsh/site-functions
  ./deno completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_deno
  install -dm755 "$pkgdir"/usr/share/fish/vendor_functions.d
  ./deno completions fish > "$pkgdir"/usr/share/fish/vendor_functions.d/deno.fish
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
