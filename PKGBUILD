# Maintainer: Aneesh Sambu <sambuaneesh at gmail dot com>
pkgname=omarchy-hyprmouse
pkgver=0.1.0
pkgrel=1
pkgdesc="Remap mouse buttons to any Omarchy hotkey, plus lighting and DPI for supported mice (pluggable drivers, Razer first)"
arch=('any')
url="https://github.com/sambuaneesh/omarchy-hyprmouse"
license=('MIT')
depends=('python' 'python-textual' 'python-rich' 'python-evdev' 'lua' 'hyprland' 'polkit')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
install=omarchy-hyprmouse.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d1dd67e9b52ed9bae854af248ebbd6fe31ba17006fb9c555c12533b6eb4a64c2')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m pytest -q
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 packaging/70-omarchy-hyprmouse.rules "$pkgdir/usr/lib/udev/rules.d/70-omarchy-hyprmouse.rules"
  install -Dm644 packaging/omarchy-hyprmouse.desktop "$pkgdir/usr/share/applications/omarchy-hyprmouse.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md CONTRIBUTING.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
