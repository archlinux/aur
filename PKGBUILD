# Maintainer: Senya <senya at riseup.net>
pkgname=crowdin-cli
pkgver=5.0.1
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://crowdin.github.io/crowdin-cli"
license=('MIT')
depends=('glibc')
arch=('x86_64' 'aarch64')
# Bun single-file executables embed the bundled JS - stripping corrupts them
options=('!strip')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/crowdin/crowdin-cli/$pkgver/LICENSE")
source_x86_64=("crowdin-$pkgver-x86_64::https://github.com/crowdin/crowdin-cli/releases/download/$pkgver/crowdin-linux-x64")
source_aarch64=("crowdin-$pkgver-aarch64::https://github.com/crowdin/crowdin-cli/releases/download/$pkgver/crowdin-linux-arm64")

# The binary checksums are filled in by the publish workflow (.github/workflows/publish.yml)
# from the crowdin-cli_checksums.sha256 release asset.
sha256sums=('86ca3b5b587e7e8722996a29717755d83bf9348b1b6d52a519232b1bf26527af')
sha256sums_x86_64=('9cb6ea7ac0e769eed8da81ed48af097e5e04f53bb5333017ecf0379af3b8ae13')
sha256sums_aarch64=('d15fe82d5a070db69af9d03ab9abe0ecb6f6fee12ac85a5c6a52677f74c41778')

build() {
  cd "$srcdir"
  chmod +x "crowdin-$pkgver-$CARCH"
  ./"crowdin-$pkgver-$CARCH" complete bash > crowdin.bash
  ./"crowdin-$pkgver-$CARCH" complete zsh > _crowdin
  ./"crowdin-$pkgver-$CARCH" complete fish > crowdin.fish
}

package() {
  install -Dm 0755 "$srcdir/crowdin-$pkgver-$CARCH" "$pkgdir"/usr/bin/crowdin
  install -Dm 0644 "$srcdir"/crowdin.bash "$pkgdir"/usr/share/bash-completion/completions/crowdin
  install -Dm 0644 "$srcdir"/_crowdin "$pkgdir"/usr/share/zsh/site-functions/_crowdin
  install -Dm 0644 "$srcdir"/crowdin.fish "$pkgdir"/usr/share/fish/vendor_completions.d/crowdin.fish
  install -Dm 0644 "$srcdir/LICENSE-$pkgver" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
