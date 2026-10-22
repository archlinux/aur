# Maintainer: YatoVoid
pkgname=macro-tool
pkgver=2.0.0
pkgrel=1
pkgdesc="Auto clicker and mouse and keyboard macro recorder for X11 and Wayland"
arch=('any')
url="https://github.com/YatoVoid/Macro-Tool"
license=('MIT')
depends=('python' 'pyside6' 'python-evdev' 'python-pynput')
optdepends=('spectacle: magnifier with real pixels when picking points on KDE Plasma Wayland'
            'grim: magnifier with real pixels when picking points on Sway and Hyprland')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
install=macro-tool.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/YatoVoid/Macro-Tool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83c0a0ac3f287d7eaa331ccd046beff7824ed23480495b4393aeb7c2f1ed2f2a')

build() {
  cd "Macro-Tool-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "Macro-Tool-$pkgver"
  QT_QPA_PLATFORM=offscreen PYTHONPATH=src:tests python -m pytest -q
}

package() {
  cd "Macro-Tool-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/linux/io.github.yatovoid.MacroTool.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 packaging/linux/io.github.yatovoid.MacroTool.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 packaging/linux/60-macro-tool.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 packaging/linux/macro-tool.conf -t "$pkgdir/usr/lib/modules-load.d/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "packaging/icons/$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/io.github.yatovoid.MacroTool.png"
  done
}
