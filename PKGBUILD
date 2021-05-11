# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=zellij
pkgver=0.9.0
pkgrel=1
pkgdesc="A terminal multiplexer."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://zellij.dev"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'binaryen')
provides=('zellij')
conflicts=('zellij-git')
source=("https://github.com/zellij-org/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6336a2654216305ddbb1887355f7baff10bbb4904ada26bcfd5ef38cc0ceffb3eba6dd826f929c982b1c8d5c517ae7a6b7d28a2cde89b57479c44552efa09614')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked --target-dir=target
  ./target/release/zellij generate-completion bash > target/zellij.bash
  ./target/release/zellij generate-completion fish > target/zellij.fish
  ./target/release/zellij generate-completion zsh > target/zellij.zsh
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/zellij -t "${pkgdir}/usr/bin"
  install -Dm644 GOVERNANCE.md README.md -t "${pkgdir}/usr/share/doc/zellij"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/zellij"
  install -Dm644 target/zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij"
  install -Dm644 target/zellij.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zellij.fish"
  install -Dm644 target/zellij.zsh "${pkgdir}/usr/share/zsh/site-functions/_zellij"
}
