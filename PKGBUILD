# Maintainer: NotMega <iamnotmega@proton.me>
pkgname=reskin
pkgver=1.1.1
pkgrel=1
pkgdesc="A modern Linux desktop theming app for browsing, applying, and managing custom themes"
arch=('x86_64')
url="https://github.com/iamnotmega/reskin"
license=('Apache-2.0')
depends=('webkit2gtk')
makedepends=('npm' 'nodejs' 'rust' 'cargo' 'git' 'desktop-file-utils')
source=("git+https://github.com/iamnotmega/reskin.git")
sha256sums=('SKIP') # Skipping for git source

build() {
  cd "$srcdir/reskin/src-tauri"

  npm install
  npm run build

  cargo build --release
}

package() {
  cd "$srcdir/reskin/src-tauri"

  # Install binary
  install -Dm755 "target/release/reskin" "$pkgdir/usr/bin/reskin"

  # Install license and readme
  install -Dm644 "$srcdir/reskin/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/reskin/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install icon (svg)
  install -Dm644 "$srcdir/reskin/public/assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/reskin.svg"

  # Create .desktop file
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/reskin.desktop" << EOF
[Desktop Entry]
Name=Reskin
Comment=Modern Linux desktop theming app for browsing, applying, and managing custom themes
Exec=/usr/bin/reskin
Icon=reskin
Type=Application
Categories=Utility;Settings;
StartupNotify=true
EOF

  # Remove mimeinfo cache file
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
}

post_install() {
  # Refresh desktop database cache for icons and .desktop files
  update-desktop-database -q
}

