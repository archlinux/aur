# Maintainer: NotMega <iamnotmega@proton.me>
pkgname=reskin
pkgver=1.6.0
pkgrel=1
pkgdesc="A modern Linux desktop theming app for browsing, applying, and managing custom themes"
arch=('x86_64')
url="https://github.com/iamnotmega/reskin"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'xdg-utils' 'mesa' 'libglvnd')
makedepends=('npm' 'nodejs' 'rust' 'cargo' 'git' 'desktop-file-utils')
source=("https://github.com/iamnotmega/reskin/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b0217a36e1813b0ced7fb71d8c0ff18c2a7d39c26a52b137ada33ac1c76b43f2')

build() {
  cd "$srcdir/reskin-$pkgver/src-tauri"

  npm install

  npm run tauri build
}

package() {
  cd "$srcdir/reskin-$pkgver/src-tauri"

  install -Dm755 "target/release/reskin" "$pkgdir/usr/bin/reskin"

  install -Dm644 "$srcdir/reskin-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/reskin-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "$srcdir/reskin-$pkgver/public/assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/reskin.svg"

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
}