# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=pori
pkgver=0.0.5
pkgrel=1
pkgdesc="Pori: Systemd Mount Manager"
arch=('x86_64')
url="https://github.com/Seafoam-Labs/Pori"
license=('GPL-3.0-only')
provides=('pori')
depends=(
    'gtk4'
    'glib2'
    'hicolor-icon-theme'
    'glibc'
    'sudo'
)
makedepends=('dotnet-sdk-10.0' 'clang')

# Source tarball from GitHub release
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Seafoam-Labs/Pori/archive/v${pkgver}.tar.gz")

sha256sums=('SKIP')

build() {
  cd "$srcdir/Pori-${pkgver}"

  dotnet publish Pori/Pori.csproj -c Release -r linux-x64 -o out --nologo -p:InstructionSet=${INSTRUCTIONS:=x86-64}
}

package() {
  cd "$srcdir/Pori-${pkgver}"

  # Install pori binary
  install -Dm755 out/pori "$pkgdir/usr/bin/pori"

  # Install icon
  install -Dm644 Pori/Assets/Pori.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/pori.png"

  # Install desktop entry
  cat <<'EOF' | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/com.pori.app.desktop"
[Desktop Entry]
Name=Pori
Comment=Systemd Mount Manager
Exec=/usr/bin/pori
Icon=pori
Type=Application
Categories=System;Utility;
Terminal=false
EOF
}
sha256sums=('bac1fab245d97125706610faa7808f8e1383545b6b4b45aba84de2bacae7af8f')
