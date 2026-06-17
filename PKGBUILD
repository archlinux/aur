# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=salus-bin
pkgver=0.2.0
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
sha256sums=('7f1f873abcbbc5b74bf2152f0b631b8d91c9c0aa49c5d03b0e38ae59e0d2a594')
sha256sums_x86_64=('7b765efe2ae62f3f5f4c4d3aabacb701b303036933d8b4888dd44b6e8f81c15c' 'e8a13c25ef41d52c7ba7aecf42ffe534206baa653dff2ae3b9f29160eb82b75e' '7954863fa37297bb6555f948aba83fb931f46ae767fdba2ad4a72cc63f23cef3')
sha256sums_aarch64=('c65408541816cdc4eabd4db7628433325ee190cd3f39a14fba3c2ae8dd887465' 'ab5ff86c1acbd3fc79d6731c4c1a165b4281f059cf424b29a558bb42c4d41edb' '94b84c5cc6ff0910a27915df478b7eeb94d8884441f0541af81617982d3f58eb')

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
