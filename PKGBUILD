# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=salus-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Local secret store guarded by Shamir secret shares and AES-256-GCM encryption (daemon + client + login agent, pre-compiled MUSL static binaries)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/salus"
license=('MIT' 'Apache-2.0')
provides=('salus')
conflicts=('salus')
depends=()
makedepends=()
install=salusd.install

_base="https://github.com/rustyhorde/salus/releases/download/v${pkgver}"

source=("${_base}/dist-salus.tar.gz")
source_x86_64=("salusd-x86_64::${_base}/salusd-x86_64-unknown-linux-musl"
               "salusc-x86_64::${_base}/salusc-x86_64-unknown-linux-musl"
               "salus-agent-x86_64::${_base}/salus-agent-x86_64-unknown-linux-musl")
source_aarch64=("salusd-aarch64::${_base}/salusd-aarch64-unknown-linux-musl"
                "salusc-aarch64::${_base}/salusc-aarch64-unknown-linux-musl"
                "salus-agent-aarch64::${_base}/salus-agent-aarch64-unknown-linux-musl")
sha256sums=('1f075cd3104f375d76463654956e4c750bbb92ca11d6735b92cd24c729e0763e')
sha256sums_x86_64=('4f5c40689627c360daa82ebff622797fbea2c5fd329bef038ac2cfda5450f67a' '32779273aaa9b98a12844468ca989dedff270b9e4d7168bf14a46db2c4086f91' '5925836001a508c8399db7fdf1a7421214feb35e4a904f8bacf78786e8e40597')
sha256sums_aarch64=('955f97407ebd3a73593502338080da898453bd4f2f23b6453020d50f96768248' 'bb6b762a550329820b767f2f4ef8f7323c359f438f513a617fd4547904012afe' 'be952b14b84059dd1a63e677d700887e8f5cd159ef598603d8b73e34630a0528')

package() {
    # Binaries (per-arch static MUSL)
    install -Dm755 "salusd-${CARCH}" "$pkgdir/usr/bin/salusd"
    install -Dm755 "salusc-${CARCH}" "$pkgdir/usr/bin/salusc"
    install -Dm755 "salus-agent-${CARCH}" "$pkgdir/usr/bin/salus-agent"

    # Man pages
    install -Dm644 salusd/salusd.1 "$pkgdir/usr/share/man/man1/salusd.1"
    install -Dm644 salusc/salusc.1 "$pkgdir/usr/share/man/man1/salusc.1"
    install -Dm644 salus-agent/salus-agent.1 "$pkgdir/usr/share/man/man1/salus-agent.1"

    # Shell completions
    install -Dm644 salusd/salusd.bash \
        "$pkgdir/usr/share/bash-completion/completions/salusd"
    install -Dm644 salusc/salusc.bash \
        "$pkgdir/usr/share/bash-completion/completions/salusc"
    install -Dm644 salus-agent/salus-agent.bash \
        "$pkgdir/usr/share/bash-completion/completions/salus-agent"
    install -Dm644 salusd/_salusd \
        "$pkgdir/usr/share/zsh/site-functions/_salusd"
    install -Dm644 salusc/_salusc \
        "$pkgdir/usr/share/zsh/site-functions/_salusc"
    install -Dm644 salus-agent/_salus-agent \
        "$pkgdir/usr/share/zsh/site-functions/_salus-agent"
    install -Dm644 salusd/salusd.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/salusd.fish"
    install -Dm644 salusc/salusc.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/salusc.fish"
    install -Dm644 salus-agent/salus-agent.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/salus-agent.fish"

    # systemd user units for the daemon and the agent
    install -Dm644 salusd/salusd.service \
        "$pkgdir/usr/lib/systemd/user/salusd.service"
    install -Dm644 salus-agent/salus-agent.service \
        "$pkgdir/usr/lib/systemd/user/salus-agent.service"

    # Example config
    install -Dm644 salusd/salusd.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/salusd.toml.example"
    install -Dm644 salus-agent/salus-agent.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/salus-agent.toml.example"

    # Licenses
    install -Dm644 salusd/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 salusd/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
