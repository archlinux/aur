# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=starfish
pkgver=0.0.6
pkgrel=1
pkgdesc="Starfish: Arch Depdency Viewer"
arch=('x86_64')
url="https://github.com/Seafoam-Labs/Starfish"
license=('GPL-3.0-only')
provides=('Starfish')
depends=(
    'shelly'
    'gtk4'
    'glib2'
    'libglvnd'
    'hicolor-icon-theme'
    'glibc'
)
makedepends=('dotnet-sdk-10.0' 'clang')

# Source tarball from GitHub release
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Seafoam-Labs/Starfish/archive/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/Starfish-${pkgver}"

  # Build the main executable
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
Icon=starfish
Type=Application
Categories=System;Utility;
Terminal=false
EOF

  # Install icon
  install -Dm644 Starfish/Assets/starfish.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/starfish.png"
}
sha256sums=('b23454991a24aaf3d65e1c584a9eb4e0c25effd51334784badbfd83980bef8fb')
