# Maintainer: zarak <zarak.tls@zarak.fr>
pkgname=tls-snoop
pkgver=0.1.0
pkgrel=1
pkgdesc="eBPF-based TLS handshake capture daemon"
arch=('x86_64')
url="https://github.com/fayak/tls-snoop"
license=('GPL2')
depends=(
    'python'
    'python-click'
    'python-scapy'
    'python-pyroute2'
    'python-prometheus_client'
    'bcc'
    'bcc-tools'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'git'
)
backup=(
    'etc/tls-snoop/tls-snoop.conf'
)
install=tls-snoop.install
source=(
    "git+https://github.com/fayak/tls-snoop.git#tag=v$pkgver"
)
sha256sums=(
    'SKIP'
)

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install BPF C source (needed at runtime)
    install -Dm644 tls_snoop.c "$pkgdir/usr/share/tls-snoop/tls_snoop.c"

    # Install systemd service
    install -Dm644 tls-snoop.service "$pkgdir/usr/lib/systemd/system/tls-snoop.service"

    # Install logrotate config
    install -Dm644 tls-snoop.logrotate "$pkgdir/etc/logrotate.d/tls-snoop"

    # Install default config
    install -Dm644 tls-snoop.conf "$pkgdir/etc/tls-snoop/tls-snoop.conf"
}
