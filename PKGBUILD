# Maintainer: Skoczi <skoczi_real@gmail.com>
pkgname=zen-bin
pkgver=r1.gabcdef0
pkgrel=1
pkgdesc="Zen is a free and open-source web browser developed by the Vivaldi Technologies."
arch=('x86_64')
url="https://github.com/Skoczi/zen-bin"
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
provides=('zen-bin')
conflicts=('zen-bin')
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
  cat > "${pkgdir}/usr/bin/zen" <<'BINEOF'
#!/bin/bash
exec electron /usr/lib/${pkgname} "$@"
BINEOF
  chmod +x "${pkgdir}/usr/bin/zen"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/zen.desktop" <<'DESKTOPEOF'
[Desktop Entry]
Name=Zen Browser
Comment=Zen is a free and open-source web browser developed by the Vivaldi Technologies.
Exec=zen %U
Icon=zen
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true
DESKTOPEOF
}
