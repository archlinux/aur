# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartoc-bin
pkgver=1.0.3
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

_base="https://github.com/rustyhorde/barto/releases/download/v${pkgver}"

source=("${_base}/dist-bartoc.tar.gz")
source_x86_64=("bartoc-x86_64::${_base}/bartoc-x86_64-unknown-linux-musl")
source_aarch64=("bartoc-aarch64::${_base}/bartoc-aarch64-unknown-linux-musl")
sha256sums=('401959d287e938a7bbd1f595f3b385a171d06d4f4921a39241baa77bee1563cd')
sha256sums_x86_64=('9158eca1ee329d62c01fa40148cce41355f3201fafd8cce78a16d2306ef228b8')
sha256sums_aarch64=('55484b279c931674cace4e7cb12e181ff4f24bcf04e044630df1e5de7b3ad138')

package() {
    install -Dm755 "bartoc-${CARCH}" "$pkgdir/usr/bin/bartoc"

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

    # Licenses
    install -Dm644 bartoc/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 bartoc/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
