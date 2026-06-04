# Maintainer: Evilleader evilleader91@gmail.com

pkgname=optiscaler-client-bin
pkgver=1.0.5
pkgrel=3
pkgdesc="Modern desktop client for installing, updating and configuring OptiScaler across game libraries"
arch=('x86_64')
url="https://github.com/Agustinm28/Optiscaler-Client"
license=('MIT')

depends=(
  'glibc'
  'gcc-libs'
)

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

  bsdtar -xf optiscaler-client.tar.gz -C "$pkgdir/opt/optiscaler-client" --strip-components=1

  # FIX 1: correct working directory (critical for .NET/Avalonia apps)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/optiscaler-client" << 'EOF'
#!/bin/bash
cd /opt/optiscaler-client
exec ./OptiscalerClient "$@"
EOF

  # Desktop entry
  install -Dm644 optiscaler-client.desktop \
    "$pkgdir/usr/share/applications/optiscaler-client.desktop"

  # FIX 2: correct icon path (based on actual extracted structure)
  if [ -f "$pkgdir/opt/optiscaler-client/assets/icon.png" ]; then
    install -Dm644 \
      "$pkgdir/opt/optiscaler-client/assets/icon.png" \
      "$pkgdir/usr/share/pixmaps/optiscaler-client.png"
  fi
}
