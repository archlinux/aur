# Maintainer: Liv - liv.cl321@gmail.com 
pkgname=dbc-editor-git
pkgver=r46.3321861
pkgrel=1
pkgdesc="A CAN Database (DBC) Viewer and Editor"
arch=('any')
url="https://gitlab.com/livcl1/dbc-editor"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-cantools')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/livcl1/dbc-editor"
        "dbc-editor.desktop")
sha256sums=('SKIP'
            '5051da91d9cae8585acf58acfc191b4e0114b0afc917f2191c08048d085ba510')

pkgver() {
  cd "$srcdir/dbc-editor"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/dbc-editor"

  # Install source files and docs to /usr/share/dbc-editor
  install -dm755 "$pkgdir/usr/share/dbc-editor"
  cp -dr --no-preserve=ownership src docs "$pkgdir/usr/share/dbc-editor/"
  
  # Install system icon
  install -Dm644 docs/logo.png "$pkgdir/usr/share/pixmaps/dbc-editor.png"
  
  # Install desktop file
  install -Dm644 "$srcdir/dbc-editor.desktop" "$pkgdir/usr/share/applications/dbc-editor.desktop"

  # Create a wrapper script in /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/dbc-editor"
#!/bin/sh
cd /usr/share/dbc-editor
exec python src/main.py "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/dbc-editor"

  # Verify logo path resolution logic
  echo "Verifying logo path resolution..."
  python3 -c "import os; basedir = '/usr/share/dbc-editor/src/'.rstrip('/').rsplit('src', 1)[0]; icon_path = os.path.join(basedir, 'docs/logo.png'); print(f'Resolved logo path: {icon_path}'); assert icon_path == '/usr/share/dbc-editor/docs/logo.png'"
}
