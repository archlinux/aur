# Maintainer: Skoczi <skoczi_real@gmail.com>
pkgname=counter-strike-global-offensive
pkgver=r1.gabcdef0
pkgrel=1
pkgdesc="Community Launcher for Counter-Strike: Global Offensive"
arch=('x86_64')
url="https://github.com/Skoczi/csgo_linux"
license=('custom:unknown')
depends=(
  'electron'
  'libxss'
  'nss'
)
makedepends=(
  'git'
  'npm'
  'nodejs'
)
provides=('counter-strike-global-offensive')
conflicts=('counter-strike-1.6')
source=("${pkgname}::git+https://codeberg.org/Skoczi/csco-launcher")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  npm install --ignore-scripts
}

build() {
  cd "${pkgname}"
  chmod +x scripts/build.sh
  npm run build
  npm prune --production
}

package() {
  cd "${pkgname}"
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r dist electron node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/csco-launcher" <<'BINEOF'
#!/bin/bash
exec electron /usr/lib/${pkgname} "$@"
BINEOF
  chmod +x "${pkgdir}/usr/bin/csco-launcher"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/csco-launcher.desktop" <<'DESKTOPEOF'
[Desktop Entry]
Name=Counter-Strike Global Offensive Launcher
Comment=Community Launcher for Counter-Strike: Global Offensive
Exec=csco-launcher %U
Icon=csco-launcher
Type=Application
Categories=Game;
StartupNotify=true
DESKTOPEOF
}
