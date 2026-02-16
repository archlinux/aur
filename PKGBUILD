# Maintainer: Marcos <your-email@example.com>

pkgname=trenchkit-git
pkgver=r150.0a2de44
pkgrel=1
pkgdesc="A collection of tools for trench operations (Tapawingo/TrenchKit)"
arch=('x86_64')
url="https://github.com/Tapawingo/TrenchKit"
license=('MIT')
depends=('qt6-base' 'openssl')
makedepends=('git' 'cmake' 'ninja' 'qt6-base' 'qt6-tools')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/TrenchKit"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/TrenchKit"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_C_STANDARD=11 \
    -DENABLE_CPIO=OFF \
    -DENABLE_CAT=OFF
  cmake --build build
}

package() {
  cd "$srcdir/TrenchKit"
  install -Dm755 build/src/TrenchKit "$pkgdir/usr/bin/trenchkit"
  # If updater is needed, install it too
  if [[ -f build/updater/updater ]]; then
    install -Dm755 build/updater/updater "$pkgdir/usr/bin/trenchkit-updater"
  fi
  # Install icon
  install -Dm644 extras/logo/logo_transparent.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/trenchkit.png"
  # Create and install desktop entry
  mkdir -p "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/trenchkit.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=TrenchKit
Comment=A mod manager for Foxhole
Exec=trenchkit
Icon=trenchkit
Categories=Utility;Game;
Terminal=false
StartupNotify=true
EOF
  # Install license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
