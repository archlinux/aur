# Maintainer: Alexandre Boutrik <alexandreboutrik@protonmail.ch>
pkgname=bouclier-bleu
pkgver=0.12.1
pkgrel=1
pkgdesc="Modular NGAV/EDR designed to prevent ransomware, break exploit chains, and reduce the system's attack surface."
arch=('x86_64')
url="https://github.com/alexandreboutrik/bouclier-bleu"
license=('Apache-2.0' 'GPL-2.0-only')
depends=('linux>=5.12')
makedepends=('cargo' 'clang' 'llvm' 'pkgconf' 'bpf' 'libelf' 'zlib' 'attr')
backup=('etc/bouclier-bleu/config.toml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexandreboutrik/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb75a4d38deb83174853a9dea178aafa99bf38d7f25a6a0ca048e8781c760cf1')

build() {
    cd "${pkgname}-${pkgver}"
    
    # Build the Rust and eBPF binaries in release mode
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install the core and cli binaries
    install -Dm755 target/release/core "$pkgdir/usr/bin/bouclier-bleu-core"
    install -Dm755 target/release/cli "$pkgdir/usr/bin/bouclier-bleu-cli"

    # Install the systemd service file
    install -Dm644 systemd/bouclier-bleu.service "$pkgdir/usr/lib/systemd/system/bouclier-bleu.service"

    # Provision the configuration directory
    install -Dm600 config.toml "$pkgdir/etc/bouclier-bleu/config.toml"
}
