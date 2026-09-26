# Maintainer: Sean Snell <ssnell@lakecs.net>
pkgname=smc-bridge
pkgver=1.0.0
pkgrel=1
pkgdesc="Bridges the M-Vave/SINCO SMC-Mixer control surface to jack_mixer over MIDI via PipeWire"
arch=('any')
url="https://github.com/dhtseany/smc-bridge"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6')
optdepends=('python-pyalsa: live MIDI transport for --headless hardware control')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dhtseany/smc-bridge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e1d5422471addc149f2ce61adda82aaf708cd550ed99a374b8725289e5aa0b5')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  QT_QPA_PLATFORM=offscreen python -m unittest discover -s tests -v
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 systemd/smc-bridge.service "$pkgdir/usr/lib/systemd/user/smc-bridge.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
