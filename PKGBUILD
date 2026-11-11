# Maintainer: David Kantun <dkantun@gmail.com>

pkgname=libria
pkgver=2.3.1
pkgrel=1
pkgdesc="Application for professional book creation and typesetting — book editor and layout tool with real-time preview, EPUB/DOCX/PDF export, spell checking, and offline voice dictation"
arch=('x86_64')
url="https://github.com/Gargadon/libria"
license=('AGPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'libsecret' 'ghostscript' 'nodejs' 'nss' 'alsa-lib' 'vosk-api')
makedepends=('bun' 'rust' 'npm' 'python' 'pkgconf')
optdepends=('chromium: PDF export (one compatible browser required)'
            'google-chrome: PDF export (alternative browser)'
            'brave-bin: PDF export (alternative browser)'
            'brave-origin-bin: PDF export (alternative browser)'
            'opera: PDF export (alternative browser)'
            'vivaldi: PDF export (alternative browser)')
provides=("${pkgname}")
# GCC LTO objects from ring cannot be linked by Rust's lld linker.
options=('!lto')
source=("${url}/archive/v${pkgver}.tar.gz" 'system-browser.patch' 'vivliostyle-csp.patch')
sha256sums=('18391f3eee9eba381b8ad486d5c8d52063e7937db1bbdcc5bf881de08a092ae8'
            '7b6e68c2643cef3f1a6e008914bac871047f1b6f8de62157f20b83a505776c9c'
            'cc1ab2feba278b2c7dbb62d0f617b487e9d168501b8bb9a3291e75ca4fe1faf3')

prepare() {
  cd "${srcdir}/libria-${pkgver}"
  # Release archives may use CRLF; the packaging patches use LF.
  python - <<'PY'
from pathlib import Path
for filename in ('scripts/pdf-export.mjs', 'src-tauri/src/main.rs'):
    path = Path(filename)
    path.write_bytes(path.read_bytes().replace(b'\r\n', b'\n'))
PY
  patch -Np1 -i "${srcdir}/system-browser.patch"
  patch -Np1 -i "${srcdir}/vivliostyle-csp.patch"
  # Use the system browser instead of downloading a private Chrome runtime.
  python - <<'PY'
import json
from pathlib import Path
config = Path('src-tauri/tauri.conf.json')
data = json.loads(config.read_text())
data['build']['beforeBuildCommand'] = 'bun run build && bun run tauri:prepare --system-browser'
config.write_text(json.dumps(data, indent=2) + '\n')
PY
  bun install --frozen-lockfile
}

build() {
  cd "${srcdir}/libria-${pkgver}"
  # Use Arch Vosk; bundle all six small language models at build time.
  LIBRIA_VOSK_SYSTEM_ENGINE=1 bun run tauri:build -- --no-bundle
}

check() {
  cd "${srcdir}/libria-${pkgver}"
  # All six models must load offline with the Vosk library supplied by Arch.
  test ! -d build/tauri-resources/vosk/engine || return 1
  test ! -d build/tauri-resources/vosk/host || return 1
  src-tauri/target/release/libria --verify-dictation-resources build/tauri-resources/vosk
}

package() {
  cd "${srcdir}/libria-${pkgver}"

  # Aplicación
  install -Dm755 src-tauri/target/release/libria "${pkgdir}/usr/bin/libria"
  # Tauri resolves Linux resources using productName, whose spelling is "Libria".
  local _runtime="${pkgdir}/usr/lib/Libria/runtime"
  install -dm755 "${_runtime}"
  # Exclude bundled runtimes, including leftovers from previous builds.
  tar -C build/tauri-resources --exclude='./node' --exclude='./browsers' \
    --exclude='./browser.json' --exclude='./vosk/engine' --exclude='./vosk/host' -cf - . | tar --no-same-owner -C "${_runtime}" -xf -
  # Keep installed resources readable and traversable by normal users.
  chmod -R u=rwX,go=rX "${_runtime}"
  ln -s /usr/bin/node "${_runtime}/node"

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
  cp -a build/licenses/. "${pkgdir}/usr/share/licenses/libria/"
}
