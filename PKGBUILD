pkgname=qrgen
pkgver=1.0_beta
pkgrel=1
pkgdesc="A simple QR code generator"
arch=('x86_64')
url="https://github.com/Saber0324/qrgen"
license=('GPL-3.0-only')
depends=('python' 'pyside6' 'python-pillow' 'qt6-svg')
makedepends=('uv' 'python-installer')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Saber0324/qrgen/archive/refs/tags/v1.0-beta.tar.gz")
sha256sums=('80b8fb2151c6159e9d3181fd1837b7fb4d077d1cde4f584d59321919a52eb637')
build() {
  cd "qrgen-1.0-beta"
  uv build --wheel
  uv pip install segno --target=./vendor --no-deps
}
package() {
  cd "qrgen-1.0-beta"
  PYVER=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  python -m installer --destdir="$pkgdir" dist/*.whl
  cp -r vendor/* "$pkgdir/usr/lib/python$PYVER/site-packages/"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/qrgen" <<'EOF'
#!/bin/sh
exec python -m qrgen.main "$@"
EOF
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/qrgen.desktop" <<'EOF'
[Desktop Entry]
Name=qrgen
Comment=A styled QR code generator
Exec=qrgen
Icon=qrgen
Type=Application
Categories=Graphics;Utility;
Terminal=false
EOF
}
