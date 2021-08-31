# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=zellij
pkgver=0.16.0
pkgrel=1
pkgdesc="A terminal multiplexer."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://zellij.dev"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'binaryen')
provides=('zellij')
conflicts=('zellij-git' 'zellij-bin')
source=("https://github.com/zellij-org/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('959ab86bdbb000cd1c41879ff734441f6da6c45bc8370239b190d5f3b2882d9681b6032791a1459dc5cb1108b9f801672bbb60180ec6667f53e244fc5b668805')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
  ./target/release/zellij setup --generate-completion bash > target/zellij.bash
  ./target/release/zellij setup --generate-completion fish > target/zellij.fish
  ./target/release/zellij setup --generate-completion zsh > target/zellij.zsh
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
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
