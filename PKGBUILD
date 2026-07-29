# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=xberg
pkgname=xberg-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Command-line interface for Xberg document intelligence (OCR and text extraction)"
arch=('x86_64' 'aarch64')
url="https://github.com/xberg-io/xberg"
license=('MIT')
depends=('libgcc' 'libstdc++')
provides=("xberg=$pkgver" "kreuzberg=$pkgver")
conflicts=('xberg' 'kreuzberg' 'kreuzberg-bin')
replaces=('kreuzberg-bin')
options=('!debug')
source_x86_64=("xberg-cli-$pkgver-x86_64.tar.gz::https://github.com/xberg-io/$_pkgname/releases/download/v$pkgver/xberg-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("xberg-cli-$pkgver-aarch64.tar.gz::https://github.com/xberg-io/$_pkgname/releases/download/v$pkgver/xberg-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4f10913e054cdedc495dc22dd905ecfd63e7abb2a124114c047ede08d64b2b6c')
sha256sums_aarch64=('8030441815fd4fc5664d0bbdec9c300aca9da03194d7f68b847f1f9a81c86fec')

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
