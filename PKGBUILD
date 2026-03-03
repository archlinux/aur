# Maintainer: Javier Tia <floss@jetm.me>

pkgname=pkgtrack
pkgver=0.1.0
pkgrel=1
pkgdesc='Track which Arch Linux packages you actually use via eBPF execution tracing'
license=('MIT')
arch=('any')
url='https://github.com/jetm/pkgtrack'
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
depends=(
    'bcc-libbpf-tools'
    'python'
    'python-click'
    'python-rich'
    'python-systemd'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('25b9fd32c2387eebcfa5704edb6d8ac89a3409de86e468c8354e691895b82883')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 systemd/pkgtrack-collector.service "$pkgdir/usr/lib/systemd/system/pkgtrack-collector.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
