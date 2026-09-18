# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=o-pi-desktop-git
pkgver=r545.g8bf6f09
pkgrel=1
pkgdesc="Orion's Pi Agent with custom tools and enhancements (Desktop version)"
arch=('x86_64')
url='https://github.com/Orion-zhen/o-pi'
license=('AGPL-3.0-only')
depends=('bash' 'electron' 'gcc-libs' 'git' 'glibc')
makedepends=('bun>=1.4.0' 'nodejs')
provides=('o-pi-desktop')
conflicts=('o-pi-desktop')

source=("o-pi::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/o-pi"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/o-pi"
  ELECTRON_SKIP_BINARY_DOWNLOAD=1 bun install --no-save
}

build() {
  cd "$srcdir/o-pi"
  bun run build:desktop --dir
}

package() {
  cd "$srcdir/o-pi"
  install -dm755 "$pkgdir/usr/lib/opi-desktop"
  cp -r dist/desktop/app/. "$pkgdir/usr/lib/opi-desktop/"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/opi-desktop" <<'EOF'
#!/bin/sh
exec /usr/bin/electron /usr/lib/opi-desktop/ "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/opi-desktop"

  local icon size
  for icon in assets/icons/linux/*.png; do
    size=${icon##*/}
    size=${size%.png}
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/opi-desktop.png"
  done

  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/opi-desktop.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=opi-desktop
Comment=AI coding agent
Comment[zh_CN]=AI 编程助手
Exec=opi-desktop
Icon=opi-desktop
StartupWMClass=opi-desktop
Terminal=false
Categories=Development;
EOF

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
