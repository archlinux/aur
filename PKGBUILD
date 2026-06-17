# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=salus-bin
pkgver=0.1.3
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
sha256sums=('83448b6e05e9c7c63fa8d0b3c4246b9f01d0471b7a5fddde0f500d1a9c44c87d')
sha256sums_x86_64=('29e06f8846d99dc47e1c7911d044235c7bdb865979b3e0a1caf10df895a02a98' '44c06a37d4e4bc3f15b1ed63cd2b3df51db0794f58f894ea7abc16bc4da945b6' '79daea4a03f0f45e0b1667629e03d283dbb075a91b6c3963e16e2d3bedcafd84')
sha256sums_aarch64=('2e381c4af95a19bb91d12d062792b3adbe62c1037135a47e9aa0a648ce32eb80' '87a0e99689d1822eb39b4ef2bad78c9c4718e5c4d0b9966c3b26a893a509333d' 'b3209695500deb5880f88f6262ff276873cf32039571d8dd3f7b5c73ce5ca2cd')

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
