# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=rbw
pkgver=1.3.0
pkgrel=1
makedepends=('rust' 'cargo')
depends=('pinentry' 'openssl')
conflicts=('rbw-git' 'rbw-bin')
provides=('rbw')
arch=('i686' 'x86_64' 'aarch64')
url="https://git.tozt.net/${pkgname}"
source=(https://git.tozt.net/rbw/snapshot/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7255e322b8c6bd6ee9da00f4c54211e94a132abec15b9f51b8351af31a4744ac')
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
