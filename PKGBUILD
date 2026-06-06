# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartos-bin
pkgver=1.5.8
pkgrel=1
pkgdesc="Barto central job scheduling server (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/barto"
license=('MIT' 'Apache-2.0')
provides=('bartos')
conflicts=('bartos')
depends=()
optdepends=('mariadb: local database server'
            'logrotate: periodic cleanup of rotated log files'
            'xz: xz compression of rotated log files')
makedepends=()
options=(!strip !debug)
install=bartos.install

_base="https://github.com/rustyhorde/barto/releases/download/v${pkgver}"

source=("${_base}/dist-bartos.tar.gz")
source_x86_64=("bartos-x86_64::${_base}/bartos-x86_64-unknown-linux-musl")
source_aarch64=("bartos-aarch64::${_base}/bartos-aarch64-unknown-linux-musl")
sha256sums=('83afc636e0e83e0ab8298d554acf85fff1d332aa3884ab136b7bb718dba20039')
sha256sums_x86_64=('6e00fdb50292d8fcf05339b538707c307c46f19f6285e76fa523d846b99533ce')
sha256sums_aarch64=('7549d9907172acda9b91e87bfb53f3eecaeeb5e5715e290d3216ebc6ab5762b4')

package() {
    install -Dm755 "bartos-${CARCH}" "$pkgdir/usr/bin/bartos"

    # Launcher script (reads systemd credentials, exports as env vars)
    install -Dm755 "bartos/bartos-launcher" "$pkgdir/usr/lib/bartos/bartos-launcher"

    # Secrets init helper
    install -Dm755 "bartos/bartos-secrets-init" "$pkgdir/usr/bin/bartos-secrets-init"

    # Migration helper
    install -Dm755 "bartos/barto-migrate" "$pkgdir/usr/bin/barto-migrate"

    # Database migrations
    install -dm755 "$pkgdir/usr/share/bartos/migrations"
    install -m644 bartos/migrations/*.sql "$pkgdir/usr/share/bartos/migrations/"

    # Man page
    install -Dm644 bartos/bartos.1 "$pkgdir/usr/share/man/man1/bartos.1"

    # Shell completions
    install -Dm644 bartos/bartos.bash \
        "$pkgdir/usr/share/bash-completion/completions/bartos"
    install -Dm644 bartos/_bartos \
        "$pkgdir/usr/share/zsh/site-functions/_bartos"
    install -Dm644 bartos/bartos.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/bartos.fish"

    # Systemd service
    install -Dm644 bartos/bartos.service \
        "$pkgdir/usr/lib/systemd/system/bartos.service"

    # Log rotation helper script
    install -Dm755 bartos/bartos-logrotate \
        "$pkgdir/usr/lib/bartos/bartos-logrotate"

    # Systemd timer for log rotation
    install -Dm644 bartos/bartos-logrotate.service \
        "$pkgdir/usr/lib/systemd/system/bartos-logrotate.service"
    install -Dm644 bartos/bartos-logrotate.timer \
        "$pkgdir/usr/lib/systemd/system/bartos-logrotate.timer"

    # Example config
    install -Dm644 bartos/bartos.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/bartos.toml.example"

    # Documentation
    install -Dm644 bartos/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 bartos/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 bartos/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
