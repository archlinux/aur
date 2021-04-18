# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=rbw-git
_name=${pkgname%-*}
pkgver=1.2.0
pkgrel=1
makedepends=('rust' 'cargo' 'git')
depends=('pinentry' 'openssl')
conflicts=('rbw' 'rbw-bin')
provides=('rbw')
arch=('i686' 'x86_64')
url="https://git.tozt.net/${_name}"
source=(git+https://git.tozt.net/${_name})
sha256sums=('SKIP')
pkgdesc="unofficial bitwarden cli"
license=('MIT')

build() {
    cd "${_name}"
    cargo build --release --locked
    cargo run --release --locked --bin rbw -- gen-completions bash >bash-completions
    cargo run --release --locked --bin rbw -- gen-completions zsh >zsh-completions
    cargo run --release --locked --bin rbw -- gen-completions fish >fish-completions
}

check() {
    cd "${_name}"
    cargo test --release --locked
}

package() {
    cd "${_name}"
    install -Dm 755 target/release/rbw -t "${pkgdir}/usr/bin"
    install -Dm 755 target/release/rbw-agent -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 bash-completions "${pkgdir}/usr/share/bash-completion/completions/rbw"
    install -Dm 644 zsh-completions "${pkgdir}/usr/share/zsh/site-functions/_rbw"
    install -Dm 644 fish-completions "${pkgdir}/usr/share/fish/vendor_completions.d/rbw.fish"
}
