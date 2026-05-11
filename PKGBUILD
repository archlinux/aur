# Maintainer: Origin Security <support@originhq.com>
pkgname=praxis-bin
pkgver=0.9.28
pkgrel=2
pkgdesc='Praxis - Semantic Command & Control Framework for Agents (pre-built)'
arch=('x86_64')
url='https://github.com/originsec/praxis'
license=('Apache-2.0')
depends=('rabbitmq' 'gcc-libs' 'glibc')
backup=('etc/praxis/env')
options=('!lto')
install=praxis.install
source=(
    "praxis-${pkgver}-x86_64-linux.tar.gz::https://github.com/originsec/praxis/releases/download/v0.9.28/praxis-0.9.28-x86_64-linux.tar.gz"
    'praxis-service.service'
    'praxis-sysusers.conf'
    'praxis-tmpfiles.conf'
    'praxis.env'
    'praxis.install'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    cd "$srcdir/praxis-${pkgver}-x86_64-linux"

    # Binaries — service, CLI, node agent. The web server is intentionally
    # not installed; manage Praxis via the `praxis` TUI.
    install -Dm755 praxis_service "$pkgdir/usr/bin/praxis_service"
    install -Dm755 praxis_cli     "$pkgdir/usr/bin/praxis_cli"
    ln -s praxis_cli "$pkgdir/usr/bin/praxis"

    install -Dm755 praxis_node              "$pkgdir/usr/share/praxis/nodes/praxis_node_linux"
    install -Dm644 praxis_node_windows.exe  "$pkgdir/usr/share/praxis/nodes/praxis_node_windows.exe"

    # praxisctl ships in the release tarball.
    install -Dm755 praxisctl "$pkgdir/usr/bin/praxisctl"

    # Systemd unit (single service; no umbrella).
    install -Dm644 "$srcdir/praxis-service.service" "$pkgdir/usr/lib/systemd/system/praxis-service.service"

    install -Dm644 "$srcdir/praxis-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/praxis.conf"
    install -Dm644 "$srcdir/praxis-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/praxis.conf"

    install -Dm644 "$srcdir/praxis.env" "$pkgdir/etc/praxis/env"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
