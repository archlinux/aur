# Maintainer: Liv - liv.cl321@gmail.com 
pkgname=dbc-editor-git
pkgver="1.0.0"
pkgrel=1
pkgdesc="A cute pixel-art themed CAN Database (DBC) Viewer and Editor"
arch=('any')
url="https://gitlab.com/livcl/dbc-viewer"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-cantools')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/livcl/dbc-viewer.git"
        "dbc-editor.desktop")
sha256sums=('SKIP'
            '689a71256985ef8c7ec103b35db14b7fe1839a1b044a27440d80c03f7570993a')

# This automatically updates the version number based on your git commits
pkgver() {
  cd "$srcdir/dbc-viewer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/dbc-viewer"

  # 1. Install the main script and logo to a shared system directory
  install -Dm755 can_editor.py "$pkgdir/usr/share/dbc-editor/can_editor.py"
  install -Dm644 logo.png "$pkgdir/usr/share/dbc-editor/logo.png"

  # 2. Create a global terminal command to launch it
  install -d "$pkgdir/usr/bin"
  echo '#!/bin/bash' > "$pkgdir/usr/bin/dbc-editor"
  echo 'exec python /usr/share/dbc-editor/can_editor.py "$@"' >> "$pkgdir/usr/bin/dbc-editor"
  chmod +x "$pkgdir/usr/bin/dbc-editor"

  # 3. Install the .desktop launcher
  install -Dm644 "$srcdir/dbc-editor.desktop" "$pkgdir/usr/share/applications/dbc-editor.desktop"

  # 4. Install the icon to the standard Linux icon directory
  install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/dbc-editor.png"
}
