# Maintainer: Ildar Minaev <minaev.ildar@gmail.com>
pkgname=input-action-controller
pkgver=0.1.0
pkgrel=1
pkgdesc="Map Linux input events to configurable actions"
url="https://github.com/IldarMinaev/input-action-controller"
arch=('any')
license=('MIT')
depends=('python' 'python-pyudev' 'python-evdev' 'python-tomlkit' 'systemd' 'sudo' 'acl' 'coreutils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pyudev' 'python-evdev' 'python-tomlkit' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0dfa2ade23ea464e38ca8dac1bb05a1c34c153a2d807b5dc276f1b8a30148a48')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  PYTHONPATH=src python -m unittest discover -s tests -v
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 packaging/input-action-controller.service \
    "$pkgdir/usr/lib/systemd/user/input-action-controller.service"
  install -Dm644 config.example.toml \
    "$pkgdir/usr/share/doc/input-action-controller/config.example.toml"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/input-action-controller/README.md"
  install -Dm644 docs/configuration.md \
    "$pkgdir/usr/share/doc/input-action-controller/docs/configuration.md"
  install -Dm644 docs/device-discovery.md \
    "$pkgdir/usr/share/doc/input-action-controller/docs/device-discovery.md"
  install -Dm644 docs/examples/handy-gnome-wayland.md \
    "$pkgdir/usr/share/doc/input-action-controller/docs/examples/handy-gnome-wayland.md"
  install -Dm644 docs/examples/dsnote-gnome-wayland.md \
    "$pkgdir/usr/share/doc/input-action-controller/docs/examples/dsnote-gnome-wayland.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
