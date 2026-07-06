# Maintainer: David Kantun <dkantun@gmail.com>

pkgname=libria
pkgver=1.8.3
pkgrel=1
pkgdesc="Application for professional book creation and typesetting — book editor and layout tool with real-time preview, EPUB/DOCX/PDF export, and spell checking"
arch=('x86_64')
url="https://github.com/Gargadon/libria"
license=('MIT')
depends=('electron>=32' 'ghostscript')
makedepends=('bun' 'python')
provides=("${pkgname}")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2ac491eeb7087b7559475e58d4e953b44cccda2d96571c01a09f72e02f29fdf8')

prepare() {
  cd "${srcdir}/libria-${pkgver}"
  bun install
}

build() {
  cd "${srcdir}/libria-${pkgver}"
  bun run build
}

package() {
  cd "${srcdir}/libria-${pkgver}"

  # Aplicación
  local _dest="${pkgdir}/opt/libria"
  install -dm755 "${_dest}/dist/libria"
  cp -r dist/libria/browser/. "${_dest}/dist/libria/browser/"
  cp main.js preload.js package.json "${_dest}/"
  cp -r build/licenses "${_dest}/licenses"
  install -Dm644 build/icon.png "${_dest}/build/icon.png"

  # Script de lanzamiento
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/libria" << 'SCRIPT'
#!/bin/bash
export GDK_BACKEND=x11
export ELECTRON_OZONE_PLATFORM_HINT=x11
exec /usr/bin/electron --ozone-platform=x11 /opt/libria/main.js "$@"
SCRIPT
  chmod 755 "${pkgdir}/usr/bin/libria"

  # Desktop entry
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/libria.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Libria
Comment=Professional book editor and typesetter
Exec=/usr/bin/libria %F
Icon=libria
Terminal=false
Type=Application
MimeType=application/x-libria;
Categories=Office;WordProcessor;Development;
StartupWMClass=Libria
DESKTOP

  # Icono
  install -Dm644 build/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/libria.png"

  # Asociación de archivos .libria
  install -dm755 "${pkgdir}/usr/share/mime/packages"
  cat > "${pkgdir}/usr/share/mime/packages/libria.xml" << 'MIME'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-libria">
    <comment>Libria Document</comment>
    <glob pattern="*.libria"/>
    <icon name="libria"/>
  </mime-type>
</mime-info>
MIME

  # Licencias
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/libria/LICENSE"
}
