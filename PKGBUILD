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
prepare() {
  cd "$srcdir"
  ar x "${pkgname}-${pkgver}.deb"

  # Extract data archive safely (handles .xz/.zst/.gz)
  bsdtar -xf data.tar.*
}

}

package_pictopy-bin() {
  cd "$srcdir"

  # Copy system files
  if [ -d "usr" ]; then
    cp -a usr "$pkgdir/"
  fi

  # Copy application bundle (THIS IS THE IMPORTANT PART)
  if [ -d "opt" ]; then
    cp -a opt "$pkgdir/"
  fi

  # Ensure backend binaries are executable
  find "$pkgdir/opt/PictoPy" -type f -exec chmod +x {} +

  # Symlink launcher
  install -d "$pkgdir/usr/bin"
  ln -sf /opt/PictoPy/PictoPy "$pkgdir/usr/bin/pictopy"

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/pictopy.desktop" <<EOF
[Desktop Entry]
Name=PictoPy
Comment=Desktop image gallery
Exec=pictopy
Icon=PictoPy
Type=Application
Categories=Graphics;Utility;
Terminal=false
EOF
}
