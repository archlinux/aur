# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=starfish
pkgver=0.0.1
pkgrel=2
pkgdesc="Starfish: Arch Depdency Viewer"
arch=('x86_64')
url="https://github.com/Seafoam-Labs/Starfish"
license=('GPL-3.0-only')
provides=('Starfish')
depends=(
    'shelly'
    'gtk4'
    'glib2'
    'mesa'
    'hicolor-icon-theme'
    'glibc'
)
makedepends=('dotnet-sdk-10.0' 'clang')

# Source tarball from GitHub release
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Seafoam-Labs/Starfish/archive/v${pkgver}.tar.gz")

sha256sums=('8b3acc13a4fc7315a3a694126da25635f173fff2e880c905759261c8afda01c3')

build() {
  cd "$srcdir/Starfish-${pkgver}"

  dotnet publish Starfish/Starfish.csproj -c Release -r linux-x64 -o out --nologo -p:InstructionSet=${INSTRUCTIONS:=x86-64}
}

package() {
  cd "$srcdir/Starfish-${pkgver}"

  # Install starfish-ui binary
  install -Dm755 out/starfish-ui "$pkgdir/usr/bin/starfish"

  # Install desktop entry
  cat <<'EOF' | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/com.seafoamlabs.starfish.desktop"
[Desktop Entry]
Name=Starfish
Comment=Arch Depdency Viewer
Exec=/usr/bin/starfish
Icon=starfishlogo
Type=Application
Categories=System;Utility;
Terminal=false
EOF

  # Install icon
  install -Dm644 Starfish/Assets/starfish.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/starfishlogo.png"
}
