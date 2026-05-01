pkgname=rclone-python-gui
pkgver=1.1
pkgrel=1
pkgdesc="PyQt6 GUI frontend for rclone"
arch=('any')
url="https://github.com/xlordnoro/rclone_python_GUI"
license=('MIT')
depends=('python' 'python-pyqt6' 'rclone')

source=(
  "rclone-python-gui-$pkgver.tar.gz::https://github.com/xlordnoro/rclone_python_GUI/archive/refs/tags/v$pkgver.tar.gz"
  "rclone-python-gui.desktop"
)
sha256sums=('ac4c2d5275a5f32a6776f08f3bc17afeebe2b9e4f690c1aec34ea5d0f27b9743'
            '7d8a8b05397829082e71a891fdeb4a636fd28aa9105cf671f2878627500b9aa5')

package() {
  cd "rclone_python_GUI-$pkgver"

  # Install application files
  install -d "$pkgdir/usr/share/rclone-python-gui"
  cp -r * "$pkgdir/usr/share/rclone-python-gui/"

  # Install main script
  install -Dm755 rclone_GUI.py \
    "$pkgdir/usr/share/rclone-python-gui/rclone_GUI.py"

  # Create launcher wrapper
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/rclone-python-gui" << EOF
#!/bin/sh
cd /usr/share/rclone-python-gui
exec python rclone_GUI.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/rclone-python-gui"

  # Install desktop entry
  install -Dm644 "$srcdir/rclone-python-gui.desktop" \
    "$pkgdir/usr/share/applications/rclone-python-gui.desktop"

  # Install icon (if present)
  if [ -f icon.png ]; then
    install -Dm644 icon.png \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/rclone-python-gui.png"
  fi
}
