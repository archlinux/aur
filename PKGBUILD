# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=salus-bin
pkgver=0.3.0
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
sha256sums=('d4147120e547ff2ba6b0220160fbc5e6fa117274aede0a861cf7daa45d35bcc7')
sha256sums_x86_64=('57c5d8f575d29129040b265cfac8341b55bfa4d3158a69962340615e61ca347c' '77886b498a08ff92ee74dc7bc91ed175d6b840f5d099bae61dfd0e91e1c186a3' 'ec42f05accb618df732911abe42d32af182b1d4d898e8d9fcbbec37db86ed210')
sha256sums_aarch64=('c804cdc2b5947482e9d544dbfbb9b517a7c3575e8620c57a871cdabd9ca00834' '4f2a65b5bd15648b9fb76c5cfac186274c807c8549b8da330f21f7205f15475e' 'a4a0edf04ca5316c1a75de4122d0312355d5c08ba229e223bd87fc2d2f330c80')

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
