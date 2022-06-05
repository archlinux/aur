# Maintainer: MedzikUser <nivua1fn@duck.com>
_repo='MedzikUser/discordrpc'
_ver=v0.2.1

pkgname='discordrpc'
pkgver=0.2.1
pkgrel=2
pkgdesc='Fast Discord RPC Client written in Rust'
arch=('x86_64')
url="https://github.com/$_repo"
license=('GPL3')

makedepends=('cargo')
optdepends=('discord: Discord IPC socket (discord client stable)')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_ver.tar.gz")
sha512sums=('137f982c9e24eb247b748524c46e8b7f103cab769ba8d69ea84bf394e2c04956839738e75267ec59bce1c243ab436bf3d0b780740806333f6deb4eddf1fbd87f')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"

  mkdir -p "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
  target/release/$pkgname --print-completions bash -c 'none' -d 'none' > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  target/release/$pkgname --print-completions zsh -c 'none' -d 'none' > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  target/release/$pkgname --print-completions fish -c 'none' -d 'none' > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

  mkdir -p "$pkgdir/usr/share/man/man1"
  target/release/$pkgname --print-manpage -c 'none' -d 'none' | gzip > "$pkgdir/usr/share/man/man1/$pkgname.1.gz"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
