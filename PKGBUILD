# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=xberg
pkgname=xberg-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Command-line interface for Xberg document intelligence (OCR and text extraction)"
arch=('x86_64' 'aarch64')
url="https://github.com/xberg-io/xberg"
license=('MIT')
depends=('libgcc' 'libstdc++')
provides=("xberg=$pkgver")
conflicts=('xberg' 'kreuzberg' 'kreuzberg-bin')
replaces=('kreuzberg-bin')
options=('!debug')
source_x86_64=("xberg-cli-$pkgver-x86_64.tar.gz::https://github.com/xberg-io/$_pkgname/releases/download/v$pkgver/xberg-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("xberg-cli-$pkgver-aarch64.tar.gz::https://github.com/xberg-io/$_pkgname/releases/download/v$pkgver/xberg-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f92b94908867e9910838c0cbee7847abf2e3c535a677a4184ea944a8120b4c26')
sha256sums_aarch64=('c50c8a600a6c37e84e1d9f9aea14458cf06f7208a331fb25e031559fc551a65c')

prepare() {
  cd "$srcdir"
  ./xberg-cli-*-unknown-linux-*/xberg completions bash > completions.bash
  ./xberg-cli-*-unknown-linux-*/xberg completions zsh > completions.zsh
  ./xberg-cli-*-unknown-linux-*/xberg completions fish > completions.fish
}

package() {
  cd "$srcdir"
  local _d="$(echo xberg-cli-*-unknown-linux-*)"

  install -d "$pkgdir/usr/lib/xberg"
  install -m755 "$_d/xberg" "$pkgdir/usr/lib/xberg/xberg"
  install -m644 "$_d"/lib*.so.* "$pkgdir/usr/lib/xberg/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/xberg/xberg "$pkgdir/usr/bin/xberg"

  install -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/xberg"
  install -Dm644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_xberg"
  install -Dm644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/xberg.fish"

  install -Dm644 "$_d/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_d/THIRD_PARTY_LICENSES.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
}
