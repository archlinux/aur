# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartoc-bin
pkgver=1.4.8
pkgrel=1
pkgdesc="Barto job executor client (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/barto"
license=('MIT' 'Apache-2.0')
provides=('bartoc')
conflicts=('bartoc')
depends=()
optdepends=('logrotate: periodic cleanup of rotated log files'
            'xz: xz compression of rotated log files')
makedepends=()
install=bartoc.install

_base="https://github.com/rustyhorde/barto/releases/download/v${pkgver}"

source=("${_base}/dist-bartoc.tar.gz")
source_x86_64=("bartoc-x86_64::${_base}/bartoc-x86_64-unknown-linux-musl")
source_aarch64=("bartoc-aarch64::${_base}/bartoc-aarch64-unknown-linux-musl")
sha256sums=('1621fe692123b1cf9a221e4e83657ed4353b96f19f4a2e27041d6ef0d2d6ccee')
sha256sums_x86_64=('32ddec5a3a1c564ef48b68ada5dc1515e8193bbb7acd77148596c54d98d2dc15')
sha256sums_aarch64=('358448e9ff719024ec13eb821f5cfe59d5d44cacc4acd268a29e3c3faa58edff')

package() {
    install -Dm755 "bartoc-${CARCH}" "$pkgdir/usr/bin/bartoc"

    # Launcher script (loads secrets from systemd credentials or platform keychain)
    install -Dm755 "bartoc/bartoc-launcher" "$pkgdir/usr/lib/bartoc/bartoc-launcher"

    # Interactive setup helper for systemd user credentials (lingering services)
    install -Dm755 "bartoc/bartoc-secrets-init" "$pkgdir/usr/bin/bartoc-secrets-init"

    # Man page
    install -Dm644 bartoc/bartoc.1 "$pkgdir/usr/share/man/man1/bartoc.1"

    # Shell completions
    install -Dm644 bartoc/bartoc.bash \
        "$pkgdir/usr/share/bash-completion/completions/bartoc"
    install -Dm644 bartoc/_bartoc \
        "$pkgdir/usr/share/zsh/site-functions/_bartoc"
    install -Dm644 bartoc/bartoc.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/bartoc.fish"

    # Systemd user service
    install -Dm644 bartoc/bartoc.service \
        "$pkgdir/usr/lib/systemd/user/bartoc.service"

    # Log rotation helper script
    install -Dm755 bartoc/bartoc-logrotate \
        "$pkgdir/usr/lib/bartoc/bartoc-logrotate"

    # Systemd user timer for log rotation
    install -Dm644 bartoc/bartoc-logrotate.service \
        "$pkgdir/usr/lib/systemd/user/bartoc-logrotate.service"
    install -Dm644 bartoc/bartoc-logrotate.timer \
        "$pkgdir/usr/lib/systemd/user/bartoc-logrotate.timer"

    # Example config
    install -Dm644 bartoc/bartoc.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/bartoc.toml.example"

    # Documentation
    install -Dm644 bartoc/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 bartoc/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 bartoc/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
