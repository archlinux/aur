
# Maintainer: Your Name <you@example.com>

pkgname=opencmr2-git
pkgver=\1.r\2.gf1f89d8
pkgrel=1
pkgdesc="Open-source native Linux port of Colin McRae Rally 2.0"
arch=('x86_64' 'aarch64')
url="https://github.com/pablocpas/OpenCMR2"
license=('custom')
depends=('sdl3')
makedepends=('git' 'clang' 'cmake' 'ninja' 'glslang' 'spirv-cross')
provides=('opencmr2')
conflicts=('opencmr2')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd OpenCMR2

  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed -E 's/^v?([^-]+)-([0-9]+)-g/\\1.r\\2.g/' \
    | tr '-' '_' \
    || printf "0.1.r%s.g%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd OpenCMR2

  cmake --preset linux \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build --preset linux
}

package() {
  cd OpenCMR2

  install -Dm755 build/linux/src/opencmr2 \
    "$pkgdir/usr/bin/opencmr2"

  install -Dm644 res/opencmr2_256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/opencmr2.png"

  install -d "$pkgdir/usr/share/applications"

  cat > "$pkgdir/usr/share/applications/opencmr2.desktop" <<'EOF'
[Desktop Entry]
Name=OpenCMR2
Comment=Colin McRae Rally 2.0
Exec=opencmr2
Icon=opencmr2
Terminal=false
Type=Application
Categories=Game;SportsGame;
EOF
}
