# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=salus-bin
pkgver=0.1.1
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
sha256sums=('cc0e1beaa989ddd362a6801765c0f1673c7758c5162daa9e66ba831827660274')
sha256sums_x86_64=('17c55fccbdacd7b320b6b64b1e3ee7700a55e500ee40199bc2a0e7f88f2e7ec3' 'c4f5ff2ff6ec3b2baa771d387bc5257b0c1197e4012c39166fb95b525d8e8440' 'bea87a985c0e45f08e342e6b7e1907aeda70d96011577b38f2b2ee88186c876a')
sha256sums_aarch64=('9c23e53db227ff6f06cc7a21f38b8c354aa8ee882b2f76b5a89d0dfdd06208f3' '83e7bffa6f6542df314b460b07894ca85e56f6854c345432815c1d3fd61edac6' 'c20b3d7bcb9602a6c40dfb7811502725367774d449825e9085f2949b74fda5c8')

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
