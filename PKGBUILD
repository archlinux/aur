# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=feather-pdf
pkgver=1.0.0
pkgrel=1
pkgdesc="FeatherPDF is an ultra-lightweight PDF viewer."
arch=('x86_64')
url="https://github.com/felipealfonsog/FeatherPDF"
license=('MIT')
depends=('python' 'python-pip' 'python-pyqt5')

source=("https://github.com/felipealfonsog/FeatherPDF/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('3e6da0582ebc599e5b624c899faec3ad78e69cce4e4cd0ce0d3529f279a5fd51')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Instalación del script Python
  install -Dm755 "$srcdir"/FeatherPDF-v."${pkgver}"/src/featherpdf.py "${pkgdir}/usr/local/bin/feather-pdf.py"
  
  # Creación de un script shell para ejecutar feather-pdf.py y copiarlo a /usr/local/bin
  echo '#!/bin/bash' > feather-pdf
  echo 'python3 /usr/local/bin/feather-pdf.py "$@"' >> feather-pdf
  chmod +x feather-pdf
  install -Dm755 feather-pdf "${pkgdir}/usr/local/bin/feather-pdf"

  # Instalación del icono
  install -Dm644 "$srcdir"/FeatherPDF-v."${pkgver}"/src/fpdf-iconlogo.png "${pkgdir}/usr/share/pixmaps/feather-pdf.png"

  # Creación del archivo .desktop dinámicamente
  cat << EOF > feather-pdf.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=FeatherPDF
Comment=Ultra-lightweight PDF viewer
Exec=feather-pdf.py
Icon=feather-pdf
Terminal=false
Categories=Utility;Office;
EOF
  install -Dm644 feather-pdf.desktop "${pkgdir}/usr/share/applications/feather-pdf.desktop"

  # Actualización del menú principal
  xdg-desktop-menu forceupdate

  # Actualización de los iconos en los menús
  xdg-icon-resource forceupdate

  # Actualización de los menús en GNOME
  glib-compile-schemas /usr/share/glib-2.0/schemas

  # Actualización de los menús en KDE Plasma
  kbuildsycoca5 --noincremental
}
