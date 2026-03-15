pkgname=termix-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Modern cross-platform SSH client built with Electron"
arch=('x86_64')
url="https://github.com/Termix-SSH/Termix"
license=('Apache-2.0')

depends=(
  'glibc'
  'gtk3'
  'nss'
  'libxss'
)

options=('!strip' '!debug')

source=(
  "termix-linux-x64.tar.gz::https://github.com/Termix-SSH/Termix/releases/download/release-$pkgver-tag/termix_linux_x64_portable.tar.gz"
  "termix.desktop"
  "termix.png"
)

sha256sums=('f25dfb389acdfd87b45f97201e9cf841bf36d646c7d93179b03963b6939a3ef1'
            'e7e212579407ecb581d2c22ef115fbbe4b2a0b07781515cd714a2499904e4623'
            '028538b18db920510c0f52887c897ca7f2d753be1bbe675e87cd9710c5081086')

package() {
  # Install application files
  install -dm755 "$pkgdir/opt/termix"
  cp -r termix_linux_x64_portable/* "$pkgdir/opt/termix/"

  # Rename upstream binary to avoid PATH conflicts
  mv "$pkgdir/opt/termix/termix" "$pkgdir/opt/termix/termix-bin"

  # Wrapper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/termix" <<'EOF'
#!/bin/bash
export LD_LIBRARY_PATH="/opt/termix:${LD_LIBRARY_PATH}"
exec /opt/termix/termix-bin "$@"
EOF

  # Desktop entry
  install -Dm644 "$srcdir/termix.desktop" \
    "$pkgdir/usr/share/applications/termix.desktop"

  # Application icon (512x512)
  install -Dm644 "$srcdir/termix.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/termix.png"

  # License
  if [[ -f "$pkgdir/opt/termix/LICENSE.electron.txt" ]]; then
    install -Dm644 \
      "$pkgdir/opt/termix/LICENSE.electron.txt" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}

