# Maintainer: ArDali <support@ardali.app>
# AUR package for Arch-based distros.
# We download the AppImage to extract the necessary bundled libraries (libbass, libprojectM)
# but we DISCARD the old system libraries (like glib, gstreamer, wayland) to let the app
# run on the native Arch Linux stack. This fixes YouTube and Vulkan/Wayland crashes.

pkgname=ardali-bin
pkgver=5.5.2
pkgrel=1
pkgdesc="ArDali WebMedia multimedia ecosystem for Linux"
arch=('x86_64')
url="https://ardali.app"
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'gtk3'
  'libnotify'
  'libxss'
  'libxtst'
  'nss'
  'xdg-utils'
)
provides=('ardali' 'ardali-webmedia')
conflicts=('ardali' 'aurivo-bin')
options=(!strip !debug)

_owner="Muhammed-Dali"
_repo="ArDali-WebMedia"
_tag="v${pkgver}"
_appimage="ArDali-${pkgver}-linux-x86_64.AppImage"

source=(
  "https://github.com/${_owner}/${_repo}/releases/download/${_tag}/${_appimage}"
)
sha256sums=('7f489a6edbfcf84b9a1196072ab126cdb5bc8212ace235e7dced23eba2d5f386')

build() {
  cd "${srcdir}"
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

package() {
  cd "${srcdir}/squashfs-root"

  # Install the extracted Electron AppImage payload.
  install -dm755 "${pkgdir}/opt/ardali-webmedia"
  cp -r --no-preserve=ownership . "${pkgdir}/opt/ardali-webmedia/"
  find "${pkgdir}/opt/ardali-webmedia" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/ardali-webmedia" -type f -exec chmod a+r {} +
  chmod 755 "${pkgdir}/opt/ardali-webmedia/ardali"
  chmod 755 "${pkgdir}/opt/ardali-webmedia/AppRun"
  chmod 755 "${pkgdir}/opt/ardali-webmedia/chrome_crashpad_handler"
  chmod 4755 "${pkgdir}/opt/ardali-webmedia/chrome-sandbox" || true

  # Create a wrapper script in /usr/bin with bundled native addon/library paths.
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/ardali-webmedia" << 'EOF'
#!/bin/sh
export LD_LIBRARY_PATH="/opt/ardali-webmedia/resources/native/build/Release:/opt/ardali-webmedia/resources/native-dist/linux:/opt/ardali-webmedia${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec /opt/ardali-webmedia/ardali "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/ardali-webmedia"
  ln -s /usr/bin/ardali-webmedia "${pkgdir}/usr/bin/ardali"

  # Install desktop entry and icons.
  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 ardali.desktop "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"
  sed -i 's|^Exec=.*|Exec=/usr/bin/ardali-webmedia %U|' "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"
  sed -i 's/^Icon=.*/Icon=ardali-webmedia/' "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"
  sed -i 's/^Categories=.*/Categories=Network;WebBrowser;/' "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"
  sed -i 's|^MimeType=.*|MimeType=x-scheme-handler/http;x-scheme-handler/https;text/html;x-scheme-handler/ardali;|' "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"

  if [ -d usr/share/icons ]; then
    cp -r --no-preserve=ownership usr/share/icons "${pkgdir}/usr/share/"
  fi
  install -Dm644 ardali.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ardali-webmedia.png"
}
