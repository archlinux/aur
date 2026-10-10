# Maintainer: Talha Caglar <talhacaglarr@proton.me>
pkgname=omarchy-focus
pkgver=0.2.0
pkgrel=1
pkgdesc="Pomodoro timer, task queue and site blocker for Omarchy, with a native bar widget, TUI and CLI"
arch=('any')
url="https://github.com/talhacaglar/omarchy-focus"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
checkdepends=('python-pytest')
optdepends=(
  'polkit: password prompt for the site guard when started from the bar'
  'libnotify: desktop notifications'
  'libcanberra: sound when a session ends'
)
install=omarchy-focus.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e137c0bbfc1278f736b34b423e9c0973b411ca4c486674d7a9246e6e4f90b23')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  # The QML model test needs node; skip it here rather than depend on node.
  PYTHONPATH=src python -m pytest -q -k "not PluginModelTest"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # Generic legacy aliases are too likely to clash system-wide.
  rm -f "$pkgdir/usr/bin/focus" "$pkgdir/usr/bin/focus-indicator"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md REFERENCE.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 examples/systemd/omarchy-focus-recover.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm755 examples/omarchy-shell/omarchy-focus-bar.sh "$pkgdir/usr/bin/omarchy-focus-bar"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/"
}
