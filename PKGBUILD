# Maintainer: Marley <warburtonmarley@proton.me>
pkgname=cpupower-gtk
pkgver=1.0.1
pkgrel=1
pkgdesc="A modern, polished GTK4/Libadwaita graphical interface for cpupower CPU power management."
arch=('any')
url="https://github.com/marleylinux/cpupower-gtk"
license=('GPL-3.0-only')
install=cpupower-gtk.install
depends=('python>=3.11' 'python-gobject' 'gtk4' 'libadwaita' 'cpupower')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marleylinux/cpupower-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9162cd09ea0f0dff7d62f02c98e6fc910931330920f986ff5b10de16c4f06f6c')

package() {
  cd "$srcdir/cpupower-gtk-"* 2>/dev/null || cd "$srcdir/cpupower-gtk" 2>/dev/null || cd "$srcdir"

  # copy python files
  install -d "$pkgdir/usr/share/cpupower-gtk"
  install -m644 src/*.py "$pkgdir/usr/share/cpupower-gtk/"
  chmod 755 "$pkgdir/usr/share/cpupower-gtk/app.py"
  chmod 755 "$pkgdir/usr/share/cpupower-gtk/backend.py"

  # copy assets
  install -d "$pkgdir/usr/share/cpupower-gtk/assets"
  cp -r src/assets/. "$pkgdir/usr/share/cpupower-gtk/assets/"
  find "$pkgdir/usr/share/cpupower-gtk/assets" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/cpupower-gtk/assets" -type f -exec chmod 644 {} +

  # system icons
  for size in 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    install -m644 "src/assets/com.marley.cpupower-gtk.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.marley.cpupower-gtk.png"
  done

  # desktop launcher
  install -Dm644 "com.marley.cpupower-gtk.desktop" "$pkgdir/usr/share/applications/com.marley.cpupower-gtk.desktop"

  # polkit policy
  install -Dm644 "com.marley.cpupower-gtk.policy" "$pkgdir/usr/share/polkit-1/actions/com.marley.cpupower-gtk.policy"

  # systemd service override
  install -Dm644 "cpupower-gtk.conf" "$pkgdir/usr/lib/systemd/system/cpupower.service.d/cpupower-gtk.conf"

  # systemd sleep hook
  install -Dm755 "cpupower-gtk-sleep" "$pkgdir/usr/lib/systemd/system-sleep/cpupower-gtk"


  # binary launcher
  install -d "$pkgdir/usr/bin"
  cat <<WRAPPER > "$pkgdir/usr/bin/cpupower-gtk"
#!/bin/sh
export PYTHONPATH="/usr/share/cpupower-gtk:\$PYTHONPATH"
exec python3 /usr/share/cpupower-gtk/app.py "\$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/cpupower-gtk"
}
