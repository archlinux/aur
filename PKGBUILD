# Maintainer: RadicalMuffinMan <support@moonfin.app>
pkgname=moonfin-bin
_pkgname=moonfin
pkgver=1.3.3
pkgrel=1
pkgdesc="Jellyfin & Emby media client for Linux (binary release)"
arch=('x86_64')
url="https://github.com/Moonfin-Client/Mobile-Desktop"
license=('GPL-3.0-or-later')
depends=('gtk3' 'glib2' 'mpv' 'libsecret')
provides=('moonfin')
conflicts=('moonfin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Moonfin-Client/Mobile-Desktop/releases/download/${pkgver}/Moonfin_Linux_v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  local src_dir="${srcdir}/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -r "${src_dir}"/* "${pkgdir}/usr/lib/${_pkgname}/"

  # Drop bundled libs that should come from distro packages
  rm -f "${pkgdir}/usr/lib/${_pkgname}/lib/libmpv.so."*
  rm -f "${pkgdir}/usr/lib/${_pkgname}/lib/libsecret-1.so."*

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/bin/sh
APPDIR="/usr/lib/${_pkgname}"
export LD_LIBRARY_PATH="\$APPDIR/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
exec "\$APPDIR/${_pkgname}" "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << EOF
[Desktop Entry]
Name=Moonfin
Comment=Jellyfin & Emby media client
Exec=${_pkgname} %u
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=AudioVideo;Video;Player;
MimeType=x-scheme-handler/jellyfin;x-scheme-handler/emby;
StartupWMClass=${_pkgname}
EOF

  local icon="${src_dir}/data/flutter_assets/assets/icons/${_pkgname}.png"
  if [ -f "${icon}" ]; then
    install -Dm644 "${icon}" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  fi
}
