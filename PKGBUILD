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
source=("$pkgname-$pkgver.tar.gz::https://github.com/marleylinux/Ryzenadj-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('54adacbf793ebbc187a766a0b32e6b93b2b23f0be53b60c34cabffb6e368dc0e')

package() {
  cd "$srcdir/Ryzenadj-"*

  # Install Python files
  install -d "$pkgdir/usr/share/ryzenadj-gtk"
  install -m644 *.py "$pkgdir/usr/share/ryzenadj-gtk/"
  chmod 755 "$pkgdir/usr/share/ryzenadj-gtk/app.py"

  # Install Icon (SVG is scalable, so it goes to hicolor/scalable)
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -m644 "ryzenadj-gtk.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.marley.ryzenadj-gtk.svg"

  # Install Desktop file
  install -Dm644 "com.marley.ryzenadj-gtk.desktop" "$pkgdir/usr/share/applications/com.marley.ryzenadj-gtk.desktop"

  # Install systemd service
  install -Dm644 "ryzenadj-gtk-apply.service" "$pkgdir/usr/lib/systemd/system/ryzenadj-gtk-apply.service"

  # Install sudoers rules
  install -d "$pkgdir/etc/sudoers.d"
  cat <<WRAPPER > "$pkgdir/etc/sudoers.d/ryzenadj-gtk"
%wheel ALL=(ALL) NOPASSWD: /usr/bin/ryzenadj
%wheel ALL=(ALL) NOPASSWD: /usr/local/bin/ryzenadj
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl enable ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl disable ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl enable --now ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl disable --now ryzenadj-gtk-apply.service
%wheel ALL=(ALL) NOPASSWD: /usr/bin/systemctl is-enabled ryzenadj-gtk-apply.service
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
