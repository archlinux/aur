# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartos-bin
pkgver=1.5.10
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
sha256sums=('7fe266ccfeb619becae2f699d1f006fc7448eb335706249879e6e6383c4ca273')
sha256sums_x86_64=('735510aa5fe52a34e87971a964a7d0260bd3bb84b65774b0384df87e287ba930')
sha256sums_aarch64=('76d48e73a7e821cab3173bc66a2be69eac25529ba1b0a4ff025537aaafc74cac')

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
