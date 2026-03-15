pkgname=farmmod
pkgver=0.1.0
pkgrel=2
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

_srcdir="FarmMod-main"
source=("$pkgname-$pkgver.tar.gz::https://github.com/henriquejsza/FarmMod/archive/refs/heads/main.tar.gz")
sha256sums=("c5b9a6d43c5180dd463852ff91ed992f2f54e38b1ba369907b6b3c2c1b981c4d")

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

  if [[ -x "$pkgdir/usr/bin/farmmod-hub" && ! -x "$pkgdir/usr/bin/farmmod" ]]; then
    ln -s "farmmod-hub" "$pkgdir/usr/bin/farmmod"
  fi

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "AUTHORS" "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"

  install -Dm644     "packaging/io.github.henriquejsza.farmmod-hub.desktop"     "$pkgdir/usr/share/applications/io.github.henriquejsza.farmmod-hub.desktop"

  install -Dm644     "data/logo/io.github.henriquejsza.farmmod-hub.png"     "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.henriquejsza.farmmod-hub.png"
  install -Dm644     "data/logo/io.github.henriquejsza.farmmod-hub.png"     "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.henriquejsza.farmmod-hub.png"
  install -Dm644     "data/logo/io.github.henriquejsza.farmmod-hub.png"     "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.henriquejsza.farmmod-hub.png"

  install -Dm644     "data/style.css"     "$pkgdir/usr/share/farmmod/data/style.css"
  install -Dm644     "data/logo/io.github.henriquejsza.farmmod-hub.png"     "$pkgdir/usr/share/farmmod/data/logo/io.github.henriquejsza.farmmod-hub.png"

  install -Dm644     "data/style.css"     "$pkgdir$_python_stdlib/data/style.css"
  install -Dm644     "data/logo/io.github.henriquejsza.farmmod-hub.png"     "$pkgdir$_python_stdlib/data/logo/io.github.henriquejsza.farmmod-hub.png"
}
