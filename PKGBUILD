pkgname=memory-pak-git
_pkgname=memory-pak
pkgver=0.2.0.r37.g4a39bb3
pkgrel=1
pkgdesc='A game collection tracker that tracks consoles, games, and collectibles'
arch=('x86_64')
url='https://memory-pak.aspenini.com/'
license=('MIT')

depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')

makedepends=(
  'git'
  'bun'
  'rust'
  'curl'
  'wget'
  'rustup'
  'cargo'
)

provides=('memory-pak')
conflicts=('memory-pak')

source=("$_pkgname::git+https://github.com/Aspenini/Memory-Pak.git")
sha256sums=('SKIP')

options=(!debug !lto)

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  bun run setup
}

build() {
  cd "$srcdir/$_pkgname"

  bun run build:desktop
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/memory-pak" \
    "$pkgdir/usr/bin/memory-pak"

  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "icons/linux/AppIcon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/memory-pak.png"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/applications/memory-pak.desktop"

  cat > "$pkgdir/usr/share/applications/memory-pak.desktop" <<EOF
[Desktop Entry]
Name=Memory Pak
Comment=A game collection tracker
Exec=memory-pak
Icon=memory-pak
Terminal=false
Type=Application
Categories=Game;Utility;
EOF
}
