# Maintainer: NotMega <iamnotmega@proton.me>
pkgname=reskin-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A modern Linux desktop theming app for browsing, applying, and managing custom themes (nightly build)"
arch=('x86_64')
url="https://github.com/iamnotmega/reskin"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'xdg-utils')
makedepends=('npm' 'nodejs' 'rust' 'cargo' 'git' 'desktop-file-utils')
source=("git+https://github.com/iamnotmega/reskin.git#branch=dev")
pkgver() {
    cd "$srcdir/reskin"
    echo "0.0.$(git rev-list --count HEAD)"
}
sha256sums=('SKIP')

build() {
    cd "$srcdir/reskin/src-tauri"
    npm install
    npm run build
    cargo build --release
}

package() {
    cd "$srcdir/reskin/src-tauri"
    install -Dm755 "target/release/reskin" "$pkgdir/usr/bin/reskin"
    install -Dm644 "$srcdir/reskin/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/reskin/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/reskin/public/assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/reskin.svg"
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
