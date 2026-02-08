# Maintainer: ZeNx98 <zenx98x@gmail.com>
pkgname=firedocs
pkgver=2.2.0
pkgrel=1
pkgdesc="FireDocs: Minimalist PDF Viewer"
arch=('x86_64')
url="https://github.com/ZeNx98/FireDocs"
license=('Apache')
depends=('gtk3' 'alsa-lib' 'nss' 'nspr')
makedepends=('nodejs' 'npm')
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "FireDocs"
  npm install
}

build() {
  cd "FireDocs"
  # Build the application (unpacked directory structure)
  npm run dist -- --linux --dir -c.compression=store
}

package() {
  cd "FireDocs"

  # Install the app to /opt/firedocs
  install -d "$pkgdir/opt/firedocs"
  cp -r dist/linux-unpacked/* "$pkgdir/opt/firedocs/"

  # Symlink binary
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/firedocs/firedocs" "$pkgdir/usr/bin/firedocs"

  # Install Icon
  install -Dm644 "web/icon.png" "$pkgdir/usr/share/pixmaps/firedocs.png"

  # Create Desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/firedocs.desktop"
[Desktop Entry]
Name=FireDocs
Comment=Minimalist PDF Viewer
Exec=firedocs %u
Icon=firedocs
Terminal=false
Type=Application
Categories=Office;Viewer;
MimeType=application/pdf;
EOF
}
