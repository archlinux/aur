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
  # Instalar el script Python
  install -Dm755 "$srcdir"/FeatherPDF-v."${pkgver}"/src/featherpdf.py "${pkgdir}/usr/local/bin/feather-pdf.py"
  
  # Crear un script shell para ejecutar feather-pdf.py y copiarlo a /usr/local/bin
  echo '#!/bin/bash' > feather-pdf
  echo 'python3 /usr/local/bin/feather-pdf.py "$@"' >> feather-pdf
  chmod +x feather-pdf
  install -Dm755 feather-pdf "${pkgdir}/usr/local/bin/feather-pdf"

  # Instalar el icono
  install -Dm644 "$srcdir"/FeatherPDF-v."${pkgver}"/src/fpdf-iconlogo.png "${pkgdir}/usr/share/pixmaps/feather-pdf.png"

  # Crear el archivo .desktop dinámicamente
  cat << EOF > feather-pdf.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=FeatherPDF
Comment=Ultra-lightweight PDF viewer
Exec=feather-pdf.py
Icon=feather-pdf
Terminal=false
Categories=Office;Utility;
EOF
  install -Dm644 feather-pdf.desktop "${pkgdir}/usr/share/applications/feather-pdf.desktop"

  # Actualizar el caché de menús
  update-desktop-database -q

  # Actualizar el caché de iconos
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor

  # Instalar en menú de Fluxbox
  mkdir -p "${pkgdir}/usr/share/fluxbox"
  ln -s "/usr/share/applications/feather-pdf.desktop" "${pkgdir}/usr/share/fluxbox/"

  # Instalar en menú de Blackbox
  mkdir -p "${pkgdir}/usr/share/blackbox"
  ln -s "/usr/share/applications/feather-pdf.desktop" "${pkgdir}/usr/share/blackbox/"

  # Instalar en menú de Enlightenment
  mkdir -p "${pkgdir}/usr/share/applications/enlightenment"
  ln -s "/usr/share/applications/feather-pdf.desktop" "${pkgdir}/usr/share/applications/enlightenment/"
}
