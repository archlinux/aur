# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
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
  install -Dm755 "$srcdir"/FeatherPDF-v."${pkgver}"/src/featherpdf.py "${pkgdir}/usr/local/bin/feather-pdf.py"
  
  # Create a shell script to execute feather-pdf.py and copy it to /usr/local/bin
  echo '#!/bin/bash' > feather-pdf
  echo 'python3 /usr/local/bin/feather-pdf.py "$@"' >> feather-pdf
  chmod +x feather-pdf
  install -Dm755 feather-pdf "${pkgdir}/usr/local/bin/feather-pdf"

  # Install the icon
  install -Dm644 "$srcdir"/FeatherPDF-v."${pkgver}"/src/fpdf-iconlogo.png "${pkgdir}/usr/share/pixmaps/feather-pdf.png"

  # Create the .desktop file dynamically
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

  # Move the .desktop file to the Enlightenment menu directory
  install -Dm644 feather-pdf.desktop "${pkgdir}/usr/share/enlightenment/data/applications/"
}

