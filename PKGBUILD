# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgbase=starfish
pkgname=(starfish libstarfish)
pkgver=0.0.6
pkgrel=2
pkgdesc="Starfish: Arch Depdency Viewer"
arch=('x86_64')
url="https://github.com/Seafoam-Labs/Starfish"
license=('GPL-3.0-only')
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
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Seafoam-Labs/Starfish/archive/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/Starfish-${pkgver}"

  # Build the shared library
  dotnet publish Starfish.GraphWidget/Starfish.GraphWidget.csproj -c Release -r linux-x64 -o out-widget --nologo -p:InstructionSet=${INSTRUCTIONS:=x86-64}

  # Build the main executable
  dotnet publish Starfish/Starfish.csproj -c Release -r linux-x64 -o out-app --nologo -p:InstructionSet=${INSTRUCTIONS:=x86-64}
}

package_starfish() {
  pkgdesc="Starfish: Arch Depdency Viewer"
  depends=('libstarfish' 'shelly' 'gtk4' 'glib2' 'libglvnd' 'hicolor-icon-theme' 'glibc')

  cd "$srcdir/Starfish-${pkgver}"
  
  # Install the main executable
  install -Dm755 out-app/starfish-ui "$pkgdir/usr/bin/starfish"
  
  # Install icon
  install -Dm644 Starfish/Assets/starfish.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/starfish.png"
  
  # Create desktop entry
  install -dm755 "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/starfish.desktop"
[Desktop Entry]
Name=starfish
Comment=A Modern Arch Package Manager
Exec=/usr/bin/starfish
Icon=starfish
Type=Application
Categories=System;Utility;
Terminal=false
EOF
}

package_libstarfish() {
  pkgdesc="Starfish graph visualization shared library"
  depends=('gtk4' 'glib2' 'libglvnd' 'glibc')

  cd "$srcdir/Starfish-${pkgver}"
  install -Dm755 out-widget/Starfish.GraphWidget.so "$pkgdir/usr/lib/libstarfish.so"
}
sha256sums=('b23454991a24aaf3d65e1c584a9eb4e0c25effd51334784badbfd83980bef8fb')
