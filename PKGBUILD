# Maintainer: Matias Peñaloza <mpenaloza@usm.cl>
pkgname=ramolibre
pkgver=2.5.1
pkgrel=1
pkgdesc="Organizador académico Local-First"
arch=('x86_64')
url="https://github.com/Ramo-Libre/Web"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'cairo' 'glib2')
makedepends=('rust' 'bun' 'git')

# Uso normal (descarga el tag de GitHub):
#   makepkg -si
#
# Uso local (empaqueta el binario ya compilado, sin descargar de GitHub):
#   LOCAL_RELEASE=1 makepkg -si
if [ -n "${LOCAL_RELEASE}" ]; then
  pkgrel=2
  source=()
  sha256sums=()
else
  # Clona la etiqueta/tag exacta lanzada en GitHub
  source=("${pkgname}::git+https://github.com/Ramo-Libre/Web.git#tag=v${pkgver}")
  sha256sums=('SKIP')
fi

build() {
  if [ -n "${LOCAL_RELEASE}" ]; then
    if [ ! -x "${startdir}/src-tauri/target/release/app" ]; then
      error "Binario de release no encontrado. Ejecuta 'bun run tauri:build' primero."
      return 1
    fi
    return 0
  fi

  cd "${srcdir}/${pkgname}"
  bun install --frozen-lockfile
  PUBLIC_SHOW_DEV_TOOLS="false" \
  PUBLIC_SUPABASE_URL="https://ihgteikkevsfjwgbenxu.supabase.co" \
  PUBLIC_SUPABASE_PUBLISHABLE_KEY="sb_publishable_yBASTBrLn4YJ7de1jxI4kQ_tjhny6fD" \
  PUBLIC_CLOUD_SYNC_POLL_INTERVAL=10000 \
  PUBLIC_ROLLUP_VISUALIZER="false" \
  PUBLIC_RAMOLIBRE_LAB_URL=https://lab.ramolibre.app \
  PUBLIC_TAURI_BUILD="true" \
  NO_STRIP=true \
  bun run tauri:build
}

package() {
  local _release_dir _icons
  if [ -n "${LOCAL_RELEASE}" ]; then
    _release_dir="${startdir}/src-tauri/target/release"
    _icons="${startdir}/src-tauri/icons"
  else
    _release_dir="${srcdir}/${pkgname}/src-tauri/target/release"
    _icons="${srcdir}/${pkgname}/src-tauri/icons"
  fi

  install -Dm755 "${_release_dir}/app" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${_icons}/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 "${_icons}/128x128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

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
