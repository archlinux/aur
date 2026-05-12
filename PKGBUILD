# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=sponge
pkgver=0.0.1
pkgrel=1
pkgdesc="Sponge: Systemd Mount Manager"
arch=('x86_64')
url="https://github.com/Seafoam-Labs/Sponge"
license=('GPL-3.0-only')
provides=('Sponge')
depends=(
    'gtk4'
    'glib2'
    'hicolor-icon-theme'
    'glibc'
)
makedepends=('dotnet-sdk-10.0' 'clang')

# Source tarball from GitHub release
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Seafoam-Labs/Sponge/archive/v${pkgver}.tar.gz")

sha256sums=('c6e1ee07cfd7c3fe0b5ff9bcb9f5a23c653dd10236be8238df9a21d3b01a83c8')

build() {
  cd "$srcdir/Sponge-${pkgver}"

  dotnet publish Sponge/Sponge.csproj -c Release -r linux-x64 -o out --nologo -p:InstructionSet=${INSTRUCTIONS:=x86-64}
}

package() {
  cd "$srcdir/Sponge-${pkgver}"

  # Install shelly-ui binary
  install -Dm755 out/shelly-ui "$pkgdir/usr/bin/sponge"

  # Install desktop entry
  cat <<'EOF' | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/com.sponge.app.desktop"
[Desktop Entry]
Name=Sponge
Comment=Systemd Mount Manager
Exec=/usr/bin/sponge
Icon=sponge
Type=Application
Categories=System;Utility;
Terminal=false
EOF
}
