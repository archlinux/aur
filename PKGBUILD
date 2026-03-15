pkgname=farmmod
pkgver=0.1.0
pkgrel=1
pkgdesc="Mod manager for Farming Simulator on Linux"
arch=("any")
url="https://github.com/henriquejsza/FarmMod"
license=("AGPL-3.0-or-later")
depends=(
  "python"
  "python-gobject"
  "gtk4"
  "libadwaita"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-wheel"
)
checkdepends=(
  "python-pytest"
)
provides=("farmmod-hub")
conflicts=("farmmod-hub")
replaces=("farmmod-hub")

_srcdir="FarmMod-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("3bc60be4d1a05813a2490df866c1c1342fbc4685d89a52dbe802d7e33b7dcce0")

build() {
  cd "$srcdir/$_srcdir"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_srcdir"
  pytest
}

package() {
  cd "$srcdir/$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  _python_stdlib=$(python - <<'PY'
import sysconfig
print(sysconfig.get_path("stdlib"))
PY
)

  if [[ -x "$pkgdir/usr/bin/farmmod-hub" ]]; then
    ln -s "farmmod-hub" "$pkgdir/usr/bin/farmmod"
  fi

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "AUTHORS" "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"

  install -Dm644 \
    "data/logo/io.github.henriquejsza.farmmod-hub.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.henriquejsza.farmmod-hub.png"
  install -Dm644 \
    "data/logo/io.github.henriquejsza.farmmod-hub.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.henriquejsza.farmmod-hub.png"
  install -Dm644 \
    "data/logo/io.github.henriquejsza.farmmod-hub.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.henriquejsza.farmmod-hub.png"

  install -Dm644 \
    "data/style.css" \
    "$pkgdir/usr/share/farmmod/data/style.css"
  install -Dm644 \
    "data/logo/io.github.henriquejsza.farmmod-hub.png" \
    "$pkgdir/usr/share/farmmod/data/logo/io.github.henriquejsza.farmmod-hub.png"

  install -Dm644 \
    "data/style.css" \
    "$pkgdir$_python_stdlib/data/style.css"
  install -Dm644 \
    "data/logo/io.github.henriquejsza.farmmod-hub.png" \
    "$pkgdir$_python_stdlib/data/logo/io.github.henriquejsza.farmmod-hub.png"
}
