# Maintainer: Marley <warburtonmarley@proton.me>
pkgname=ryzenadj-gtk
pkgver=1.7.0
pkgrel=1
pkgdesc="A modern, polished GTK4/Libadwaita graphical wrapper for ryzenadj (AMD power management adjustment tool)."
arch=('any')
url="https://github.com/marleylinux/Ryzenadj-gtk"
license=('GPL3')
install=ryzenadj-gtk.install
depends=('python>=3.11' 'python-gobject' 'gtk4' 'libadwaita' 'ryzenadj')
optdepends=('ryzen_smu-dkms-git: enhanced hardware monitoring and control')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marleylinux/Ryzenadj-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('091fa6a83adfa9259eb0752350e26231287741775506bd1809acb5f0942e9293')

package() {
  cd "$srcdir/Ryzenadj-"*

  # copy our python code files to the system share folder
  install -d "$pkgdir/usr/share/ryzenadj-gtk"
  install -m644 src/*.py "$pkgdir/usr/share/ryzenadj-gtk/"
  chmod 755 "$pkgdir/usr/share/ryzenadj-gtk/app.py"

  # put our graphics and logos in the asset folder
  install -d "$pkgdir/usr/share/ryzenadj-gtk/assets"
  cp -r src/assets/. "$pkgdir/usr/share/ryzenadj-gtk/assets/"
  find "$pkgdir/usr/share/ryzenadj-gtk/assets" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/ryzenadj-gtk/assets" -type f -exec chmod 644 {} +

  # set up the system launcher icons
  for size in 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    install -m644 "src/assets/com.marley.ryzenadj-gtk.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.marley.ryzenadj-gtk.png"
  done

  # install the menu desktop launcher
  install -Dm644 "com.marley.ryzenadj-gtk.desktop" "$pkgdir/usr/share/applications/com.marley.ryzenadj-gtk.desktop"

  # copy the boot apply systemd service file
  install -Dm644 "ryzenadj-gtk-apply.service" "$pkgdir/usr/lib/systemd/system/ryzenadj-gtk-apply.service"

  # add passwordless sudo rules for wheel group users so ryzenadj can apply limits on demand
  # (group-based for AUR/packages; install.sh uses per-$SUDO_USER rules for manual installs)
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

  # make /etc/ryzenadj-gtk directory so the app can save settings
  install -d -m775 -o root -g wheel "$pkgdir/etc/ryzenadj-gtk"

  # build a simple executable script in /usr/bin to run the app
  install -d "$pkgdir/usr/bin"
  cat <<WRAPPER > "$pkgdir/usr/bin/ryzenadj-gtk"
#!/bin/sh
export PYTHONPATH="/usr/share/ryzenadj-gtk:\$PYTHONPATH"
exec python3 /usr/share/ryzenadj-gtk/app.py "\$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/ryzenadj-gtk"
}
