# Maintainer: Martin Fracker, Jr. <martin.frackerjr@gmail.com>

pkgname=poketokenbar-plasma
pkgver=0.1.0
pkgrel=1
pkgdesc="AI coding token usage with a Pokemon companion, for the KDE Plasma 6 panel"
arch=('any')
url="https://github.com/rubensanchezrivero/poketokenbar-plasma"
license=('MIT')
depends=(
  'python'
  'plasma-workspace'
  'libplasma'
  'plasma5support'
  'kirigami'
  'kcmutils'
  'qt6-declarative'
)
optdepends=(
  'python-orjson: faster log parsing'
  'libnotify: desktop notifications (notify-send)'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'pyproject-build.patch'
        'poketokend.service')
sha256sums=('483848c7998bc124213da54ce4bee57816aeca1d2d9eee94a8204274abe5c1a9'
            '4eb1ac0877f76252bc587bb0b2120e86709c70793eef51a92679439e1c3185c3'
            'bbdf641530e5ab222aa8954d9f8ac9d5b7b9f3c0e61291117a1cc68e521cba05')

prepare() {
  cd "$pkgname-$pkgver"
  # Upstream's pyproject has no build-system or scripts; drop once upstream adds them.
  patch -Np1 -i ../pyproject-build.patch
  # Upstream ships LICENSE as 755, and the wheel would carry that into dist-info.
  chmod 644 LICENSE
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  # Keep the builder's real ~/.claude logs and config out of the tests.
  local home="$srcdir/check-home"
  rm -rf "$home"
  mkdir -p "$home"
  HOME="$home" \
  XDG_CONFIG_HOME="$home/.config" \
  XDG_STATE_HOME="$home/.local/state" \
  XDG_CACHE_HOME="$home/.cache" \
  XDG_DATA_HOME="$home/.local/share" \
  XDG_RUNTIME_DIR="$home/run" \
    python -m pytest -q -p no:cacheprovider
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local plasmoid
  for plasmoid in org.kde.plasma.poketokenbar org.kde.plasma.poketokenpet; do
    (cd plasmoid && find "$plasmoid" -type f \
      -exec install -Dm644 {} "$pkgdir/usr/share/plasma/plasmoids/{}" \;)
  done

  install -Dm644 "$srcdir/poketokend.service" -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
