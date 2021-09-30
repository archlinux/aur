# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=zellij
pkgver=0.18.1
pkgrel=1
pkgdesc="A terminal multiplexer"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://zellij.dev"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zellij-org/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('533301a994a5ec65254cc17d5d651a0aed5ad259dcb9549213de6f964232fb047690136026f1602dfacda5eb7edf20d12846e603362bcd89ea269ecf5c71cb85')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --frozen --all-features --target-dir=target
  ./target/release/zellij setup --generate-completion bash > target/zellij.bash
  ./target/release/zellij setup --generate-completion fish > target/zellij.fish
  ./target/release/zellij setup --generate-completion zsh > target/zellij.zsh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/zellij -t "${pkgdir}/usr/bin"
  install -Dm644 GOVERNANCE.md README.md -t "${pkgdir}/usr/share/doc/zellij"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/zellij"
  install -Dm644 target/zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij"
  install -Dm644 target/zellij.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zellij.fish"
  install -Dm644 target/zellij.zsh "${pkgdir}/usr/share/zsh/site-functions/_zellij"
}
