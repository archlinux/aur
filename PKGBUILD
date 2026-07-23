# Maintainer: Matias Peñaloza <mpenaloza@usm.cl>
pkgname=ramolibre
pkgver=2.2.0
pkgrel=1
pkgdesc="Organizador académico Local-First"
arch=('x86_64')
url="https://github.com/Ramo-Libre/Web"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'cairo' 'glib2')
makedepends=('rust' 'bun' 'git')

# Clona la etiqueta/tag exacta lanzada en GitHub
source=("${pkgname}::git+https://github.com/Ramo-Libre/Web.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  bun install --frozen-lockfile
  NO_STRIP=true bun run tauri:build
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "src-tauri/target/release/app" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=Ramo Libre
Comment=Organizador académico Local-First
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Education;Utility;
StartupWMClass=ramolibre
EOF
}

post_install() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor || true
  update-desktop-database -q || true
}
post_upgrade() { post_install; }
post_remove() { post_install; }
