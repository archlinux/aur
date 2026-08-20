# Maintainer: Uthopik <josearrillaga@ik.me>
pkgname=astronex
pkgver=2.1
pkgrel=1
pkgdesc="An astrology program for calculating and drawing charts according to the API Method. Used in Huber method. Python 3 version."
arch=('any')
url="https://github.com/Uthopik/astronex-python-3"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'gtk3'
  'pyswisseph'
  'python-configobj'
  'python-pillow'
  'python-tzdata'
)
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "astronex-python-3"

  # 1. Copiar el paquete 'astronex' (que incluye locale, resources, gui, etc.) y nex.py
  install -dm755 "${pkgdir}/usr/share/astronex"
  cp -r astronex nex.py pysw.py "${pkgdir}/usr/share/astronex/"

  # 2. Instalar la fuente astrológica en el sistema
  install -Dm644 astronex/resources/Astro-Nex.ttf \
    "${pkgdir}/usr/share/fonts/TTF/Astro-Nex.ttf"

  # 3. Lanzador ejecutable en /usr/bin/astronex
  install -dm755 "${pkgdir}/usr/bin"
  cat << 'EOF' > "${pkgdir}/usr/bin/astronex"
#!/bin/sh
cd /usr/share/astronex
exec python3 nex.py "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/astronex"

  # 4. Acceso directo .desktop e icono del sistema
  install -Dm644 astronex/resources/astronex.png \
    "${pkgdir}/usr/share/pixmaps/astronex.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat << 'EOF' > "${pkgdir}/usr/share/applications/astronex.desktop"
[Desktop Entry]
Name=Astro-Nex
Comment=Astrological calculation software
Exec=astronex
Icon=astronex
Terminal=false
Type=Application
Categories=Education;Science;
EOF
}