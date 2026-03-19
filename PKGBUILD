pkgname=open-glorious-core
pkgver=0.1.0
pkgrel=1
pkgdesc="Open-source Linux control app for Glorious peripherals"
arch=("any")
url="https://github.com/MechNoxer/Open-Glorious-Core"
license=("MIT")
depends=(
  "python"
  "pyside6"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-wheel"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/MechNoxer/Open-Glorious-Core/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("SKIP")

_srcdir_name="Open-Glorious-Core-$pkgver"

build() {
  cd "$srcdir/$_srcdir_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_srcdir_name"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 99-open-glorious-core-hid.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-open-glorious-core-hid.rules"
  install -Dm644 packaging/open-glorious-core.desktop.in \
    "$pkgdir/usr/share/applications/open-glorious-core.desktop"
  sed -i \
    -e "s|__APP_EXEC__|/usr/bin/open-glorious-core|g" \
    -e "s|__ICON_NAME__|open-glorious-core|g" \
    "$pkgdir/usr/share/applications/open-glorious-core.desktop"
  install -Dm644 src/open_glorious_core/static/assets/glorious-logomark.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/open-glorious-core.svg"
}
