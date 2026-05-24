# Maintainer: Marley <warburtonmarley@proton.me>
pkgname=ryzenadj-gtk
pkgver=1.1.1
pkgrel=1
pkgdesc="A modern, polished GTK4/Libadwaita graphical wrapper for ryzenadj (AMD power management adjustment tool)."
arch=('any')
url="https://github.com/marleylinux/Ryzenadj-gtk"
license=('GPL3')
install=ryzenadj-gtk.install
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'ryzenadj')
optdepends=('ryzen_smu-dkms-git: enhanced hardware monitoring and control')
source=("com.marley.ryzenadj-gtk.desktop"
        "ryzenadj-gtk.svg"
        "app.py"
        "main.py"
        "ryzen.py"
        "styles.py"
        "ui.py"
        "init_gi.py"
        "ryzenadj-gtk-apply.service")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # Install Python files
  install -d "$pkgdir/usr/share/ryzenadj-gtk"
  install -m644 "$srcdir/"*.py "$pkgdir/usr/share/ryzenadj-gtk/"
  chmod 755 "$pkgdir/usr/share/ryzenadj-gtk/app.py"

  # Install Icon (SVG is scalable, so it goes to hicolor/scalable)
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -m644 "$srcdir/ryzenadj-gtk.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.marley.ryzenadj-gtk.svg"

  # Install Desktop file
  install -Dm644 "$srcdir/com.marley.ryzenadj-gtk.desktop" "$pkgdir/usr/share/applications/com.marley.ryzenadj-gtk.desktop"

  # Install systemd service
  install -Dm644 "$srcdir/ryzenadj-gtk-apply.service" "$pkgdir/usr/lib/systemd/system/ryzenadj-gtk-apply.service"

  # Install sudoers rules
  install -d "$pkgdir/etc/sudoers.d"
  cat <<EOF > "$pkgdir/etc/sudoers.d/ryzenadj-gtk"
%wheel ALL=(ALL) NOPASSWD: /usr/bin/ryzenadj
%wheel ALL=(ALL) NOPASSWD: /usr/local/bin/ryzenadj
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl enable ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl disable ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl enable --now ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl disable --now ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl is-enabled ryzenadj-gtk-apply.service
EOF
  chmod 440 "$pkgdir/etc/sudoers.d/ryzenadj-gtk"

  # Create system config directory and make it writable by wheel group
  install -d -m775 -o root -g wheel "$pkgdir/etc/ryzenadj-gtk"

  # Create executable wrapper
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/ryzenadj-gtk"
#!/bin/sh
export PYTHONPATH="/usr/share/ryzenadj-gtk:\$PYTHONPATH"
exec python3 /usr/share/ryzenadj-gtk/app.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/ryzenadj-gtk"
}
