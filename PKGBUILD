# Maintainer: NickeyGod <niklass.schaeffer@gmail.com>
pkgname=dbpro-appimage
pkgver=2.6.6
pkgrel=1
pkgdesc="Database management tool - MySQL, PostgreSQL, SQLite, MongoDB, Redis, and more"
arch=(x86_64)
url="https://dbpro.app"
license=(custom)
depends=(fuse2 libnotify libxtst nss gtk3 libxss)
optdepends=(
  'libappindicator-gtk3: System tray support'
)
provides=(dbpro)
conflicts=(dbpro)
options=(!strip !debug)
source_x86_64=(
  "https://releases.dbpro.app/linux-x64/DB%20Pro-${pkgver}-x86_64.AppImage"
)
sha256sums_x86_64=(
  '70fa223ab3df92ff3813e11402cefe64130fd04c836bdfd9fac0892fb9421525'
)
noextract=("${source_x86_64[0]##*/}")

package() {
  local _download_name="${source_x86_64[0]##*/}"
  local _install_name="dbpro-${pkgver}-x86_64.AppImage"

  # Install AppImage with a clean filename
  install -Dm755 "${srcdir}/${_download_name}" "${pkgdir}/opt/${pkgname}/${_install_name}"

  # Install desktop entry
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/dbpro.desktop" <<EOF
[Desktop Entry]
Name=DB Pro
Exec=/opt/${pkgname}/${_install_name} --no-sandbox --disable-setuid-sandbox %U
Terminal=false
Type=Application
Icon=dbpro
StartupWMClass=DB Pro
Comment=Database management tool
Categories=Development;
MimeType=x-scheme-handler/dbpro;
EOF

  # Install icons by extracting from the AppImage
  cd "${srcdir}"
  chmod +x "${_download_name}"
  "./${_download_name}" --appimage-extract 'usr/share/icons/hicolor/*/apps/dbpro.png' >/dev/null 2>&1 || true

  local icon
  for icon in squashfs-root/usr/share/icons/hicolor/*/apps/dbpro.png; do
    local size_dir
    size_dir=$(dirname "$(dirname "$icon")")
    local size
    size=$(basename "$size_dir")
    install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/dbpro.png"
  done

  # Symlink for /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_install_name}" "${pkgdir}/usr/bin/dbpro"
}