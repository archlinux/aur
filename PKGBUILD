# Maintainer: Marley <warburtonmarley@proton.me>
pkgname=cpupower-gtk
pkgver=1.0.2
pkgrel=4
pkgdesc="A modern, polished GTK4/Libadwaita graphical interface for cpupower CPU power management."
arch=('any')
url="https://github.com/marleylinux/cpupower-gtk"
license=('GPL-3.0-only')
install=cpupower-gtk.install
depends=('python>=3.11' 'python-gobject' 'gtk4' 'libadwaita' 'cpupower')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/marleylinux/cpupower-gtk/archive/refs/tags/v${pkgver}-${pkgrel}.tar.gz")
sha256sums=('2f0ca8b93db7523be1da6567f0f3c921468ecee587932b0ae9ffa125e132c161')

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

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
