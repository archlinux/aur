# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=zellij
pkgver=0.8.0
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
sha512sums=('369cf0ff52e5c87acad18f43698ad76ba1ec4a5fa4b607ca4c7f9f838905a18734dc7eff966ee6cad91b9819f490009f74c1c09400e4d8165e5c499d8b2e1d0a')

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
