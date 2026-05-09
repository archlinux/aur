# Maintainer: ayalarol <219218716+ayalarol@users.noreply.github.com>
pkgname=easy-ocamlfuse
pkgver=1.0.3
pkgrel=1
pkgdesc="Gestor gráfico (GUI) para google-drive-ocamlfuse"
arch=('any')
url="https://github.com/ayalarol/Easy-ocamlfuse"
license=('GPL3')
depends=('python' 'tk' 'python-pillow' 'python-requests' 'python-cryptography' 'dbus-glib')
makedepends=('gettext') # Necesario para msgfmt
optdepends=(
    'google-drive-ocamlfuse: Para poder montar unidades de Google Drive'
    'python-pystray: Para el icono en la bandeja del sistema'
    'python-notify2: Para las notificaciones de escritorio'
    'libappindicator-gtk3: Soporte de iconos en GNOME/KDE'
)
source=("https://github.com/ayalarol/Easy-ocamlfuse/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94a4b8b1ced2a97b18d332bf82508704807f502d98927c7ee02ec2b0134152ec')

prepare() {
  cd "Easy-ocamlfuse-$pkgver"
  # Compilar traducciones antes de empaquetar
  msgfmt ocamlfuse_manager_gui/locale/es/LC_MESSAGES/ocamlfuse_manager.po -o ocamlfuse_manager_gui/locale/es/LC_MESSAGES/ocamlfuse_manager.mo
  msgfmt ocamlfuse_manager_gui/locale/en/LC_MESSAGES/ocamlfuse_manager.po -o ocamlfuse_manager_gui/locale/en/LC_MESSAGES/ocamlfuse_manager.mo
}

package() {
  cd "Easy-ocamlfuse-$pkgver"

  # Instalación limpia usando install en lugar de cp (más seguro para permisos)
  install -d "$pkgdir/usr/share/easy-ocamlfuse"
  cp -r ocamlfuse_manager_gui "$pkgdir/usr/share/easy-ocamlfuse/"
  install -m755 main.py "$pkgdir/usr/share/easy-ocamlfuse/main.py"

  # Script lanzador
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/easy-ocamlfuse"
#!/bin/sh
exec python3 /usr/share/easy-ocamlfuse/main.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/easy-ocamlfuse"

  # Icono y Desktop file
  install -Dm644 ocamlfuse_manager_gui/assets/icons/gdrive_logo.png "$pkgdir/usr/share/pixmaps/easy-ocamlfuse.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/easy-ocamlfuse.desktop" <<EOF
[Desktop Entry]
Name=Easy Ocamlfuse
Comment=Monta y gestiona cuentas de Google Drive fácilmente
Exec=easy-ocamlfuse
Icon=easy-ocamlfuse
Terminal=false
Type=Application
Categories=Utility;Network;
StartupWMClass=easy-ocamlfuse
EOF
}