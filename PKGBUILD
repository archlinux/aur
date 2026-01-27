pkgbase=pictopy
pkgname=(pictopy-bin)
pkgver=1.1.0
pkgrel=2
pkgdesc="PictoPy - Desktop image gallery (Tauri/Python)"
arch=('x86_64')
url="https://github.com/AOSSIE-Org/PictoPy"
license=('GPL3')
depends=('gtk3' 'webkit2gtk' 'python' 'hicolor-icon-theme')
makedepends=('binutils' 'tar')
source=("${pkgname}-${pkgver}.deb::https://github.com/tushar1977/PictoPy/releases/download/release/PictoPy_${pkgver}_amd64.deb")
# Replace 'SKIP' with actual hash using: updpkgsums
sha256sums=('SKIP') 

prepare() {
  # Extract the debian control and data files
  ar x "pictopy-bin-${pkgver}.deb"
  tar -xf data.tar.*
}

package_pictopy-bin() {
  # Install the main files extracted from the deb
  # Using 'cp -a' preserves permissions and directory structure
  cp -a usr "$pkgdir/"
  
  if [ -d "opt" ]; then
    cp -a opt "$pkgdir/"
  fi

  # Fix permissions for the backend binaries
  # Note: Adjust these paths if the .deb structure puts them elsewhere
  find "$pkgdir/usr/lib/PictoPy" -type f -name "PictoPy_*" -exec chmod +x {} +

  # Create a symlink or wrapper to the actual binary
  # If the app is in /opt/PictoPy/PictoPy, let's link it properly
  install -d "$pkgdir/usr/bin"
  ln -sf /opt/PictoPy/PictoPy "$pkgdir/usr/bin/pictopy"

  # Clean up and fix the Desktop Entry
  rm -rf "$pkgdir/usr/share/applications/PictoPy.desktop"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/pictopy.desktop" <<EOF
[Desktop Entry]
Name=PictoPy
Comment=Desktop image gallery
Exec=picto_py
Icon=PictoPy
Type=Application
Categories=Graphics;Utility;
Terminal=false
EOF
}