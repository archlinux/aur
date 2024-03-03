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
  # Install the Python script
  install -Dm755 "$srcdir"/FeatherPDF-v."${pkgver}"/src/featherpdf.py "${pkgdir}/usr/local/bin/feather-pdf"
  
  # Install the icon
  install -Dm644 "$srcdir"/FeatherPDF-v."${pkgver}"/src/fpdf-iconlogo.png "${pkgdir}/usr/share/pixmaps/feather-pdf.png"

  # Create the .desktop file
  cat << EOF > feather-pdf.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=FeatherPDF
Comment=Ultra-lightweight PDF viewer
Exec=feather-pdf
Icon=feather-pdf
Terminal=false
Categories=Office;Utility;
EOF
  install -Dm644 feather-pdf.desktop "${pkgdir}/usr/share/applications/feather-pdf.desktop"
  
  # Update menu cache for GNOME and KDE
  update-desktop-database -q || true
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor || true

  # Install in Fluxbox menu
  mkdir -p "${pkgdir}/usr/share/fluxbox"
  ln -s "/usr/share/applications/feather-pdf.desktop" "${pkgdir}/usr/share/fluxbox/"

  # Install in Blackbox menu
  mkdir -p "${pkgdir}/usr/share/blackbox"
  ln -s "/usr/share/applications/feather-pdf.desktop" "${pkgdir}/usr/share/blackbox/"

  # Install in Enlightenment menu
  mkdir -p "${pkgdir}/usr/share/applications/enlightenment"
  ln -s "/usr/share/applications/feather-pdf.desktop" "${pkgdir}/usr/share/applications/enlightenment/"
}
