# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartos-bin
pkgver=1.5.4
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
sha256sums=('f7baf5f50c834bdde3a6d6d2358752b9416bcfb327461e4cbaaed9de71c99d24')
sha256sums_x86_64=('9c929dc0ad973e56432d7d9381e384d4df3d2e2d292314fb0df788603ca2f04a')
sha256sums_aarch64=('7b9404850fb51bbfacade8af359f67ad2fc5fc08067c7e211ca5e6c096367ebc')

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
