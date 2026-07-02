# Maintainer: Gadi Cohen <dragon at wastelands dot net>

pkgname=spdif-keepalive
pkgver=0.1.0
pkgrel=1
pkgdesc='Keep S/PDIF optical audio outputs awake with barely perceptible PCM noise'
arch=('any')
url='https://github.com/gadicc/spdif-keepalive'
license=('MIT')
depends=('bash' 'python' 'pipewire' 'libpulse' 'systemd' 'util-linux')
makedepends=('python-build' 'python-installer' 'python-packaging' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c98578d4f0787f2137e2021bea6afd0e66ed6c13daffb2b05ad9f87eebfd31de')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=src pytest
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 systemd/spdif-keepalive.service \
    "$pkgdir/usr/lib/systemd/user/spdif-keepalive.service"
  install -Dm755 systemd/spdif-keepalive-sleep \
    "$pkgdir/usr/lib/systemd/system-sleep/spdif-keepalive"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
