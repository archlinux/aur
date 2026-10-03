# Maintainer: inventory69 <inventory69@users.noreply.github.com>
pkgname=simple-notes-desktop-bin
pkgver=0.15.1
pkgrel=1
pkgdesc="Cross-platform note-taking app with WebDAV sync, built with Tauri"
arch=('x86_64')
url="https://github.com/inventory69/simple-notes-desktop"
license=('AGPL-3.0-only')
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
# LICENSE liegt im AUR-Repo (upload-aur.sh kopiert es aus dem Repo-Root), die .deb enthält keins.
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Simple.Notes.Desktop_${pkgver}_amd64.deb"
        "LICENSE")
# Eine Zeile lassen: die Skripte ersetzen per sed nur den ersten Eintrag (die .deb).
sha256sums=('2573a8bde2bfd2ff5ee605e3b7a9ef13bea1a13f78212e7f7f604cef048a5260' '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

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
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
