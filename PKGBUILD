# Maintainer: RadicalMuffinMan <support@moonfin.dev>
pkgname=moonfin
pkgver=1.3.3
pkgrel=1
pkgdesc="Jellyfin & Emby media client for Linux"
arch=('x86_64')
url="https://github.com/Moonfin-Client/Mobile-Desktop"
license=('GPL-3.0-or-later')
depends=('gtk3' 'glib2' 'mpv' 'libsecret')
provides=('moonfin')
conflicts=('moonfin')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Moonfin-Client/Mobile-Desktop/releases/download/${pkgver}/Moonfin_Linux_v${pkgver}.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
  local src_dir="${srcdir}/moonfin-${pkgver}"

  # Install app files
  install -dm755 "${pkgdir}/usr/lib/moonfin"
  cp -r "${src_dir}"/* "${pkgdir}/usr/lib/moonfin/"

  # Remove bundled mpv/libsecret — use distro packages instead
  rm -f "${pkgdir}/usr/lib/moonfin/lib/libmpv.so."*
  rm -f "${pkgdir}/usr/lib/moonfin/lib/libsecret-1.so."*

  # Wrapper script
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/moonfin" << 'EOF'
#!/bin/sh
APPDIR="/usr/lib/moonfin"
export LD_LIBRARY_PATH="$APPDIR/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "$APPDIR/moonfin" "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/moonfin"

  # Desktop entry
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/moonfin.desktop" << EOF
[Desktop Entry]
Name=Moonfin
Comment=Jellyfin & Emby media client
Exec=moonfin %u
Icon=moonfin
Terminal=false
Type=Application
Categories=AudioVideo;Video;Player;
MimeType=x-scheme-handler/jellyfin;x-scheme-handler/emby;
StartupWMClass=moonfin
EOF

  # Icon (bundled in Flutter assets)
  local icon="${src_dir}/data/flutter_assets/assets/icons/moonfin.png"
  if [ -f "${icon}" ]; then
    install -Dm644 "${icon}" "${pkgdir}/usr/share/pixmaps/moonfin.png"
  fi
}
