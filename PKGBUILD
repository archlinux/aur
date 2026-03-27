# Maintainer: Your Name <your.email@example.com>
pkgname=paper-desktop-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Paper Desktop - a local-first, markdown-based note-taking app"
arch=('x86_64')
url="https://paper.design"
license=('custom')
options=('!debug' '!strip')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3')
source=("${pkgname%-bin}-$pkgver.deb::https://download.paper.design/linux/deb")
sha256sums=('SKIP')

package() {
  # Extract the deb package
  bsdtar -xf "$srcdir/${pkgname%-bin}-$pkgver.deb" -C "$srcdir"
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  
  # Fix permissions
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;
  
  # Make binaries executable
  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \; 2>/dev/null || true
  
  # Make the main binary in /opt executable
  chmod 755 "$pkgdir/opt/Paper/paper-desktop"
  
  # Create symlink to /usr/bin if it doesn't exist
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/Paper/paper-desktop" "$pkgdir/usr/bin/paper-desktop"
}
