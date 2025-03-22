# Maintainer: Harry Adel <your-email@example.com>

pkgname=meteorman
pkgver=2.0.1
pkgrel=1
pkgdesc="A DDP client with GUI"
arch=('x86_64')
url="https://github.com/harryadel/meteorman"
license=('MIT')
depends=('electron' 'gtk3' 'libxss' 'nss')
makedepends=('npm' 'git' 'nodejs')
source=("git+https://github.com/harryadel/meteorman.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  npm install
}

build() {
  cd "${srcdir}/${pkgname}"
  npm run build
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # Create directories
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  
  # Copy application files
  cp -r build/linux-unpacked/* "${pkgdir}/usr/lib/${pkgname}"
  
  # Create symlink for the executable
  ln -s "/usr/lib/${pkgname}/meteorman" "${pkgdir}/usr/bin/meteorman"
  
  # Install desktop file
  install -Dm644 build/linux-unpacked/resources/app.asar.unpacked/build/icons/256x256.png "${pkgdir}/usr/share/pixmaps/meteorman.png"
  
  # Create desktop file
  cat > "${pkgdir}/usr/share/applications/meteorman.desktop" << EOF
[Desktop Entry]
Name=Meteorman
Comment=A DDP client with GUI
Exec=/usr/bin/meteorman
Icon=meteorman
Terminal=false
Type=Application
Categories=Development;Utility;
EOF

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
