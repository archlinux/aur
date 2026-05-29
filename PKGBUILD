# Maintainer: inventory69 <inventory69@users.noreply.github.com>
pkgname=simple-notes-desktop-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Cross-platform note-taking app with WebDAV sync, built with Tauri"
arch=('x86_64')
url="https://github.com/inventory69/simple-notes-desktop"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'hicolor-icon-theme'
)
optdepends=(
  'xdg-utils: for opening URLs in default browser'
)
provides=('simple-notes-desktop')
conflicts=('simple-notes-desktop' 'simple-notes-desktop-git')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Simple.Notes.Desktop_${pkgver}_amd64.deb")
sha256sums=('09753fe504fac30a8a93c130e076d8289e1bcd8b01e118fb12eee5848dd4a268')

package() {
  # Extract data from deb package
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  # Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/bin/simple-notes-desktop"

  # Tauri benennt die .desktop-Datei nach productName ("Simple Notes Desktop.desktop"
  # mit Leerzeichen). Wayland-Compositors (KDE) matchen Fenster über die xdg_toplevel
  # app_id gegen den Dateinamen ohne .desktop – Leerzeichen im Dateinamen verhindern
  # das Matching. Umbenennen auf die freedesktop-konforme Form (Binary-Name).
  if [[ -f "${pkgdir}/usr/share/applications/Simple Notes Desktop.desktop" ]]; then
    mv "${pkgdir}/usr/share/applications/Simple Notes Desktop.desktop" \
       "${pkgdir}/usr/share/applications/simple-notes-desktop.desktop"
  fi

  # Install license
  install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
