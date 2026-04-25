# Maintainer: UgaUgaBamBam novaria@mailbox.org
pkgname=crucible
pkgver=0.2.6
pkgrel=2
pkgdesc="Linux launcher for Windows games via UMU and Proton"
arch=('any')
url="https://github.com/northmind/Crucible"
license=('LicenseRef-proprietary')
depends=(
  'python'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-requests'
  'python-pillow'
  'umu-launcher'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=()
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/northmind/Crucible/archive/refs/tags/v$pkgver.tar.gz"
  "fix-icon.py"
)
sha256sums=('2c6a4cde11d22a67d4f7f8bdb1dd86439ba08d19ee210b08775f6c376ee6da3c'
            '96e729c2be39935aa5a1889ac8a34757ccfda1818175c453fa605dfb79f35680')

prepare() {
  cd "Crucible-$pkgver"

  # fix taskbar icon on Wayland: add setDesktopFileName and setWindowIcon
  python3 "$srcdir/fix-icon.py"

  # upstream ships no pyproject.toml; generate one
  # include-package-data=false bypasses VCS discovery so non-Python
  # files (ui/web, assets) are included via the package-data glob
  cat > pyproject.toml << EOF
[build-system]
requires = ["setuptools", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "crucible"
version = "$pkgver"
requires-python = ">=3.10"

[tool.setuptools]
include-package-data = false

[tool.setuptools.packages.find]
where = ["python"]

[tool.setuptools.package-data]
crucible = ["**/*"]
EOF
}

build() {
  cd "Crucible-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "Crucible-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/crucible" << 'EOF'
#!/bin/sh
exec python3 -m crucible "$@"
EOF

  python3 -c "
from PIL import Image
from pathlib import Path
src = Image.open('python/crucible/assets/images/icon.jpg').convert('RGBA')
for size in (256, 512):
    d = Path('$pkgdir/usr/share/icons/hicolor') / f'{size}x{size}' / 'apps'
    d.mkdir(parents=True, exist_ok=True)
    src.resize((size, size), Image.LANCZOS).save(d / 'crucible.png')
"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Crucible
GenericName=Windows Game Launcher
Comment=Linux launcher for Windows games via UMU and Proton
Exec=crucible %U
Terminal=false
Categories=Game;
Keywords=crucible;proton;umu;wine;windows;games;launcher;
Icon=crucible
StartupNotify=true
StartupWMClass=crucible
EOF
}
