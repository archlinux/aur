# Maintainer: 00ein00
pkgname=hytale-f2p-git
pkgver=2.0.1
pkgver() {
  cd "$srcdir/Hytale-F2P"
  jq -r '.version' package.json
}
pkgrel=1
pkgdesc="Hytale F2P Launcher (git version) – unofficial cross-platform launcher"
arch=('x86_64')
url="https://github.com/amiayweb/Hytale-F2P"
license=('MIT') # adjust if the project has a different license
depends=('nodejs' 'npm' 'electron')
makedepends=('git' 'nodejs' 'npm' 'electron-builder' 'jq')
provides=('hytale-f2p')
conflicts=('hytale-f2p')
source=("git+https://github.com/amiayweb/Hytale-F2P.git")
sha256sums=('SKIP')
options=('!strip')

build() {
  cd "$srcdir/Hytale-F2P"
  # install Node.js deps
  npm install
  # build desktop app (adjust if needed)
  npm run build
}

package() {
  cd "$srcdir/Hytale-F2P"

  # Install AppImage
  install -Dm755 \
    "$(ls dist/*.AppImage | grep -v blockmap)" \
    "$pkgdir/opt/hytale-f2p/hytale-f2p.AppImage"

  # Wrapper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/hytale-f2p" <<'EOF'
#!/bin/sh
exec /opt/hytale-f2p/hytale-f2p.AppImage "$@"
EOF

  # Desktop entry
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/hytale-f2p.desktop" <<'EOF'
[Desktop Entry]
Name=Hytale F2P
Comment=Unofficial Hytale F2P Launcher
Exec=hytale-f2p
Icon=hytale-f2p
Terminal=false
Type=Application
Categories=Game;
EOF

  # Icon
  install -Dm644 icon.png \
    "$pkgdir/usr/share/pixmaps/hytale-f2p.png"
}
