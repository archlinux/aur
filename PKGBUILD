_gitname="keshiki"
pkgname="${_gitname}-git"
pkgver="1.3_c45a1e7e"
pkgrel="1"
pkgdesc="Animated wallpaper manager for X11"
arch=("x86_64")
url="https://github.com/Konqi0139/Keshiki"
depends=("bash" "yad" "mpv" "xwinwrap" "socat" "xdotool" "wmctrl" "ffmpeg" "imagemagick")
provides=("keshiki")
optdepends=("yt-dlp: Download a video to apply it as a wallpaper."
	    "ffmpegthumbnailer: Extract thumbnails for wallpapers.")
license=(GPL-3.0-or-later)
url="https://github.com/Konqi0139/Keshiki.git"
source=("${pkgname}::git+${url}#branch=main")
sha256sums=("SKIP")

prepare(){
  cd "${srcdir}/${pkgname}" || return 1
}

package() {
  INSTALL_DIR="${pkgdir}/opt/${_gitname}"

  cd "${srcdir}/${pkgname}" || return 1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "$INSTALL_DIR"
  mkdir -p "$INSTALL_DIR"
  mkdir -p "$INSTALL_DIR/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  cp -rf * "$INSTALL_DIR"
  rm -f "$INSTALL_DIR/install.sh"
  rm -f "$INSTALL_DIR/README.md"
  rm -rf "$INSTALL_DIR/screenshots"
  rm -rf "$INSTALL_DIR/.git"

  ln -sf "$(command -v yad)" "$INSTALL_DIR/bin/keshiki"
  ln -sf "$(command -v yad)" "$INSTALL_DIR/bin/yadsystray"
  echo -e '#!/bin/bash\n\nsource ${DIRCONFIG}keshiki.cfg\nmpv "$@"' >"$INSTALL_DIR/bin/mpv.bash"

  chmod +x "$INSTALL_DIR/bin/mpv.bash"
  chmod +x "$INSTALL_DIR/keshiki.bash" "$INSTALL_DIR/keshiki-"*

  ln -sf "$INSTALL_DIR/keshiki.bash" "${pkgdir}/usr/bin/keshiki"

   cat << EOF > "${srcdir}/${pkgname}/keshiki.desktop"
[Desktop Entry]
Version=1.3
Name=Keshiki
Comment=Gestor de Live Wallpapers para compositores basados en X11
Exec=/opt/keshiki/keshiki.bash
Icon=/opt/keshiki/keshiki.png
Type=Application
Categories=AudioVideo;Video;GTK;Utility;
Terminal=false
StartupNotify=false
StartupWMClass=Keshiki
Keywords=wallpaper;utility;live;background;
EOF

  install -Dm755 -v "${srcdir}/${pkgname}/keshiki.desktop" "${pkgdir}/usr/share/applications/keshiki.desktop"
}
