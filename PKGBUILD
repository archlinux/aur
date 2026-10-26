# Maintainer: linkman developers <zaidejjo@users.noreply.github.com>

pkgname=linkman
pkgver=0.2.0
pkgrel=1
pkgdesc='A fast, beautiful TUI + CLI for creating and managing symlinks'
arch=('x86_64')
url='https://github.com/zaidejjo/linkman'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('linkman-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('165491fdd8c1abc4941edfb2b6370355ca74c77fa7128f3b15a014ffd14e6b60')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/linkman" "${pkgdir}/usr/bin/linkman"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Completions are generated from the CLI definition by the binary we just
  # built, so they can never drift from the installed version.
  install -d "${pkgdir}/usr/share/bash-completion/completions" \
             "${pkgdir}/usr/share/zsh/site-functions" \
             "${pkgdir}/usr/share/fish/vendor_completions.d"
  "target/release/linkman" completions bash > "${pkgdir}/usr/share/bash-completion/completions/linkman"
  "target/release/linkman" completions zsh  > "${pkgdir}/usr/share/zsh/site-functions/_linkman"
  "target/release/linkman" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/linkman.fish"
}
