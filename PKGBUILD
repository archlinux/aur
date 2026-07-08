# Maintainer: ArDali <support@ardali.app>
# AUR package for Arch-based distros.
# We download the AppImage to extract the necessary bundled libraries (libbass, libprojectM)
# but we DISCARD the old system libraries (like glib, gstreamer, wayland) to let the app
# run on the native Arch Linux stack. This fixes YouTube and Vulkan/Wayland crashes.

pkgname=ardali-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="ArDali WebMedia multimedia ecosystem for Linux"
arch=('x86_64')
url="https://ardali.app"
license=('MIT')
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
sha256sums=('55fc4dc6f37dcb25c390bd0d462b8a94b831472d437242958889eccbe93d621f')

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
  chmod 755 "${pkgdir}/opt/ardali-webmedia/ardali"
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
  sed -i 's/^Categories=.*/Categories=AudioVideo;Player;Network;/' "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"

  if [ -d usr/share/icons ]; then
    cp -r --no-preserve=ownership usr/share/icons "${pkgdir}/usr/share/"
  fi
  install -Dm644 ardali.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ardali-webmedia.png"
}
