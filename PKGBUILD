# Maintainer: NickeyGod <niklass.schaeffer@gmail.com>

pkgname=plasmallm-desktop-driver
pkgver=1.0.0
pkgrel=1
pkgdesc='Secure D-Bus daemon enabling autonomous AI agents to interact with the Linux desktop under Wayland/KDE Plasma 6'
arch=('any')
url='https://github.com/joshuaeroman/plasmallm-desktop-driver'
license=('GPL-2.0-or-later')
depends=(
  'python-dbus'
  'python-gobject'
  'python-pillow'
  'python-pyqt6'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugin-pipewire'
  'pipewire'
  'fontconfig'
)
optdepends=(
  'at-spi2-core: accessibility-tree introspection (focused element detection)'
  'xdg-desktop-portal: Freedesktop portal backend for RemoteDesktop/ScreenCast'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/joshuaeroman/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2c5964b52b43ba3077cb03e153078d4f2899b93c484d9bc4a798e6b3c3a4dfbe')

_appdir='/usr/share/plasmallm-desktop-driver'

package() {
  cd "$pkgname-$pkgver"

  # --- Application scripts ---
  install -d "$pkgdir$_appdir"
  install -m644 plasmallm-desktop-driver.py \
                plasmallm-auth-dialog.py \
                plasmallm-indicator.py \
                plasmallm-test-applet.py \
                "$pkgdir$_appdir/"
  install -m755 check_deps.sh "$pkgdir$_appdir/"
  install -m644 requirements.txt README.md "$pkgdir$_appdir/"

  # Byte-compile with a clean root-relative path (strip $pkgdir from .pyc)
  python -m compileall -q -d "$_appdir" "$pkgdir$_appdir"

  # --- /usr/bin launcher shim ---
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/plasmallm-desktop-driver" <<EOF
#!/bin/sh
exec /usr/bin/python3 $_appdir/plasmallm-desktop-driver.py "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/plasmallm-desktop-driver"

  # --- systemd user unit ---
  install -d "$pkgdir/usr/lib/systemd/user"
  sed "s|ExecStart=.*|ExecStart=/usr/bin/plasmallm-desktop-driver|" \
    packaging/systemd/plasmallm-desktop-driver.service \
    > "$pkgdir/usr/lib/systemd/user/plasmallm-desktop-driver.service"
  chmod 644 "$pkgdir/usr/lib/systemd/user/plasmallm-desktop-driver.service"

  # --- .desktop entry (NoDisplay=true; drop Icon= since none ships) ---
  install -d "$pkgdir/usr/share/applications"
  sed -e "s|Exec=EXEC_PATH|Exec=/usr/bin/plasmallm-desktop-driver|" \
      -e "/^Icon=/d" \
      packaging/com.joshuaroman.plasmallm.DesktopDriver.desktop \
      > "$pkgdir/usr/share/applications/com.joshuaroman.plasmallm.DesktopDriver.desktop"
  chmod 644 "$pkgdir/usr/share/applications/com.joshuaroman.plasmallm.DesktopDriver.desktop"

  # --- License ---
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
