# Maintainer: Codemorra <codemorra@posteo.eu>

pkgname=bulk-rename-py
pkgver=1.0.2
pkgrel=1
pkgdesc="Batch rename files with a PySide6 GUI and live preview"
arch=('any')
url="https://github.com/codemorra/bulk-rename-py"
license=('MIT')
depends=('python' 'pyside6' 'shiboken6' 'python-requests')
makedepends=()
_srcurl="https://github.com/codemorra/bulk-rename-py/archive/refs/tags/v${pkgver}.tar.gz"
source=("${pkgname}-${pkgver}.tar.gz::${_srcurl}")
sha256sums=('442a4ec0ca360f55325c0d7fdd81f2d04e374e825670e08f84092b906ffa8991')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # Code to /usr/share/<app>
  install -d "$pkgdir/usr/share/${pkgname}"
  cp -a src assets LICENSE README.md "$pkgdir/usr/share/${pkgname}/"

  # startup script
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
export BULK_RENAME_PY_UPDATE_MODE=none
exec /usr/bin/python /usr/share/bulk-rename-py/src/bulk_rename_py.py "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/${pkgname}"

  # desktop file
  if [[ -f packaging/linux/bulk-rename-py.desktop ]]; then
    install -Dm644 packaging/linux/bulk-rename-py.desktop \
      "$pkgdir/usr/share/applications/bulk-rename-py.desktop"
  fi

  # Icons
  for sz in 16 32 64 128 256 512; do
    icon="assets/icons/png/bulk-rename-py_${sz}.png"
    if [[ -f "$icon" ]]; then
      install -Dm644 "$icon" \
        "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/bulk-rename-py.png"
    fi
  done

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
