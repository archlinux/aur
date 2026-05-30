# Maintainer: Marley <warburtonmarley@proton.me>
pkgname=ryzenadj-gtk
pkgver=1.6.0
pkgrel=2
pkgdesc="A modern, polished GTK4/Libadwaita graphical wrapper for ryzenadj (AMD power management adjustment tool)."
arch=('any')
url="https://github.com/marleylinux/Ryzenadj-gtk"
license=('GPL3')
install=ryzenadj-gtk.install
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'ryzenadj')
optdepends=('ryzen_smu-dkms-git: enhanced hardware monitoring and control')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marleylinux/Ryzenadj-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aedfb993652fcca535cc970d84160d29f87c6237e85a1d00e9ac1a4156be5ee1')

package() {
  cd "$srcdir/Ryzenadj-"*

  # Install Python files
  install -d "$pkgdir/usr/share/ryzenadj-gtk"
  install -m644 src/*.py "$pkgdir/usr/share/ryzenadj-gtk/"
  chmod 755 "$pkgdir/usr/share/ryzenadj-gtk/app.py"

  # Copy assets to install directory for runtime local search path
  install -d "$pkgdir/usr/share/ryzenadj-gtk/assets"
  install -m644 src/assets/* "$pkgdir/usr/share/ryzenadj-gtk/assets/"

  # Install Icon (PNG) - 256 and 512 for modern displays
  for size in 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    install -m644 "src/assets/com.marley.ryzenadj-gtk.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.marley.ryzenadj-gtk.png"
  done

  # Install Desktop file
  install -Dm644 "com.marley.ryzenadj-gtk.desktop" "$pkgdir/usr/share/applications/com.marley.ryzenadj-gtk.desktop"

  # Install systemd service
  install -Dm644 "ryzenadj-gtk-apply.service" "$pkgdir/usr/lib/systemd/system/ryzenadj-gtk-apply.service"

  # Install sudoers rules
  install -d -m750 "$pkgdir/etc/sudoers.d"
  cat <<WRAPPER > "$pkgdir/etc/sudoers.d/ryzenadj-gtk"
%wheel ALL=(ALL) NOPASSWD: /usr/bin/ryzenadj
%wheel ALL=(ALL) NOPASSWD: /usr/local/bin/ryzenadj
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl enable ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl disable ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl enable --now ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl disable --now ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl is-enabled ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/tee /sys/class/drm/card*/device/pp_od_clk_voltage
%wheel ALL=(ALL) NOPASSWD: /usr/bin/tee /sys/class/drm/card*/device/power_dpm_force_performance_level
WRAPPER
  chmod 440 "$pkgdir/etc/sudoers.d/ryzenadj-gtk"

  # Create system config directory and make it writable by wheel group
  install -d -m775 -o root -g wheel "$pkgdir/etc/ryzenadj-gtk"

  # Create executable wrapper
  install -d "$pkgdir/usr/bin"
  cat <<WRAPPER > "$pkgdir/usr/bin/ryzenadj-gtk"
#!/bin/sh
export PYTHONPATH="/usr/share/ryzenadj-gtk:\$PYTHONPATH"
exec python3 /usr/share/ryzenadj-gtk/app.py "\$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/ryzenadj-gtk"
}
