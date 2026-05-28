# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartos-bin
pkgver=1.4.2
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
install=bartos.install

_base="https://github.com/rustyhorde/barto/releases/download/v${pkgver}"

source=("${_base}/dist-bartos.tar.gz")
source_x86_64=("bartos-x86_64::${_base}/bartos-x86_64-unknown-linux-musl")
source_aarch64=("bartos-aarch64::${_base}/bartos-aarch64-unknown-linux-musl")
sha256sums=('c674acd56440b0e82f89c6850a301a640e9f088fb6e08518bee208ceaeb9ffc7')
sha256sums_x86_64=('94dcab16e39044bd58a7945fccfd56430e6c97da2fe11e399e5f910fd687de91')
sha256sums_aarch64=('4de6ffe7b6efb032ae7a46c943e71162176d119e2fd6a41fed24bbb14c4ca844')

package() {
    install -Dm755 "bartos-${CARCH}" "$pkgdir/usr/bin/bartos"

    # Launcher script (reads systemd credentials, exports as env vars)
    install -Dm755 "bartos/bartos-launcher" "$pkgdir/usr/lib/bartos/bartos-launcher"

    # Secrets init helper
    install -Dm755 "bartos/barto-secrets-init" "$pkgdir/usr/bin/barto-secrets-init"

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

    # Logrotate
    install -Dm644 bartos/bartos.logrotate \
        "$pkgdir/etc/logrotate.d/bartos"

    # Example config
    install -Dm644 bartos/bartos.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/bartos.toml.example"

    # Documentation
    install -Dm644 bartos/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 bartos/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 bartos/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
