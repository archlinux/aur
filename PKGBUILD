# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartos-bin
pkgver=1.0.5
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

_base="https://github.com/rustyhorde/barto/releases/download/v${pkgver}"

source=("${_base}/dist-bartos.tar.gz")
source_x86_64=("bartos-x86_64::${_base}/bartos-x86_64-unknown-linux-musl")
source_aarch64=("bartos-aarch64::${_base}/bartos-aarch64-unknown-linux-musl")
sha256sums=('985bc24b59d5f761ced5beeb0034371ccfe165a8531bcb8a18f8b767f41fbaeb')
sha256sums_x86_64=('a491c4dfe699fa956a2b0106557109e32948ed1361ebc88bb6a89d85cb427013')
sha256sums_aarch64=('2bdd6d1661361db50ec48742ddb2c0ba2a300df39534e973540aee5209ffd72b')

package() {
    install -Dm755 "bartos-${CARCH}" "$pkgdir/usr/bin/bartos"

    # Migration helper
    install -Dm755 "bartos/barto-migrate" "$pkgdir/usr/bin/barto-migrate" 2>/dev/null || true

    # Database migrations (sourced from dist tarball)
    if [ -d "bartos/migrations" ]; then
        install -dm755 "$pkgdir/usr/share/bartos/migrations"
        install -m644 bartos/migrations/*.sql "$pkgdir/usr/share/bartos/migrations/"
    fi

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

    # Licenses
    install -Dm644 bartos/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 bartos/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
