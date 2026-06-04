# Maintainer: Evilleader evilleader91@gmail.com

pkgname=optiscaler-client-bin
pkgver=1.0.5
pkgrel=6
pkgdesc="Modern desktop client for installing, updating and configuring OptiScaler across game libraries"
arch=('x86_64')
url="https://github.com/Agustinm28/Optiscaler-Client"
license=('MIT')

depends=('glibc' 'gcc-libs')

provides=('optiscaler-client')
conflicts=('optiscaler-client')

source=(
  "optiscaler-client.tar.gz::https://github.com/Agustinm28/Optiscaler-Client/releases/download/OptiscalerClient-${pkgver}/OptiscalerClient-${pkgver}-linux-x64.tar.gz"
  "optiscaler-client.desktop"
)

sha256sums=('SKIP' 'SKIP')

package() {
  mkdir -p "$pkgdir/opt/optiscaler-client"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/pixmaps"

  # IMPORTANT: preserve archive exactly (NO strip-components)
  bsdtar -xf optiscaler-client.tar.gz -C "$pkgdir/opt/optiscaler-client"

  # launcher (safe for .NET/Avalonia)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/optiscaler-client" << 'EOF'
#!/bin/bash
APPDIR="/opt/optiscaler-client"
cd "$APPDIR" || exit 1
exec "$APPDIR/OptiscalerClient" "$@"
EOF

  # desktop file
  install -Dm644 optiscaler-client.desktop \
    "$pkgdir/usr/share/applications/optiscaler-client.desktop"

  # icon fallback
  if [ -f "$pkgdir/opt/optiscaler-client/assets/icon.png" ]; then
    install -Dm644 \
      "$pkgdir/opt/optiscaler-client/assets/icon.png" \
      "$pkgdir/usr/share/pixmaps/optiscaler-client.png"
  fi
}
