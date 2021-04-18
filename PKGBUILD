# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=rbw
pkgver=1.2.0
pkgrel=2
makedepends=('rust' 'cargo')
depends=('pinentry' 'openssl')
conflicts=('rbw-git' 'rbw-bin')
provides=('rbw')
arch=('i686' 'x86_64')
url="https://git.tozt.net/${pkgname}"
source=(https://git.tozt.net/rbw/snapshot/${pkgname}-${pkgver}.tar.gz)
sha256sums=('17fce8f474486550b83a2487ba7febd05d4f279cc7c53e70594d6f8ea223f5b7')
pkgdesc="unofficial bitwarden cli"
license=('MIT')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --locked
    cargo run --release --locked --bin rbw -- gen-completions bash >bash-completions
    cargo run --release --locked --bin rbw -- gen-completions zsh >zsh-completions
    cargo run --release --locked --bin rbw -- gen-completions fish >fish-completions
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 target/release/rbw -t "${pkgdir}/usr/bin"
    install -Dm 755 target/release/rbw-agent -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 bash-completions "${pkgdir}/usr/share/bash-completion/completions/rbw"
    install -Dm 644 zsh-completions "${pkgdir}/usr/share/zsh/site-functions/_rbw"
    install -Dm 644 fish-completions "${pkgdir}/usr/share/fish/vendor_completions.d/rbw.fish"
}
