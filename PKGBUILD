# Maintainer: NotMega <iamnotmega@proton.me>
pkgname=reskin
pkgver=1.1.2
pkgrel=1
pkgdesc="A modern Linux desktop theming app for browsing, applying, and managing custom themes"
arch=('x86_64')
url="https://github.com/iamnotmega/reskin"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'xdg-utils')
makedepends=('npm' 'nodejs' 'rust' 'cargo' 'git' 'desktop-file-utils')
source=("https://github.com/iamnotmega/reskin/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2ba8cd382bc1f5c67a0a1ae211659963c72106b1bd38662ca6c7e5ff47a9380a')

build() {
  cd "$srcdir/reskin-$pkgver/src-tauri"

  npm install
  npm run build

  cargo build --release
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
