# Maintainer: David Kantun <dkantun@gmail.com>

pkgname=libria
pkgver=2.1.0
pkgrel=1
pkgdesc="Application for professional book creation and typesetting — book editor and layout tool with real-time preview, EPUB/DOCX/PDF export, and spell checking"
arch=('x86_64')
url="https://github.com/Gargadon/libria"
license=('AGPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'libsecret' 'ghostscript' 'nss' 'alsa-lib')
makedepends=('bun' 'rust' 'nodejs' 'npm' 'python' 'pkgconf')
provides=("${pkgname}")
# GCC LTO objects from ring cannot be linked by Rust's lld linker.
options=('!lto')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('34c3ba9494e721f9d8b293b10216b03253e916d92b56ad8521147ad916378dbe')

prepare() {
  cd "${srcdir}/libria-${pkgver}"
  bun install --frozen-lockfile
}

build() {
  cd "${srcdir}/libria-${pkgver}"
  bun run tauri:build -- --no-bundle
}

package() {
  cd "${srcdir}/libria-${pkgver}"

  # Aplicación
  install -Dm755 src-tauri/target/release/libria "${pkgdir}/usr/bin/libria"
  install -dm755 "${pkgdir}/usr/lib/libria/runtime"
  cp -r build/tauri-resources/. "${pkgdir}/usr/lib/libria/runtime/"

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
