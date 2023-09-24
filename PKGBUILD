# Maintainer: Herbert Knapp
pkgname="the-dark-mod-bin"
pkgver=2.11
pkgrel=1
pkgdesc="First person stealth game inspired by the Thief series based on id Tech 4 engine"
arch=('x86_64')
url="https://www.thedarkmod.com/"
license=('unknown')
options=(!strip)
makedepends=('xorg-server-xvfb' 'imagemagick' 'p7zip')
source=('https://update.thedarkmod.com/zipsync/tdm_installer.linux64.zip')
sha256sums=('SKIP')
prepare() {
  chmod +x "${srcdir}/tdm_installer.linux64"
}
package() {

  cd ${pkgdir}
  Xvfb :98 -screen 0 1024x768x24 -nolisten tcp &
  while ! xdpyinfo -display :98 >/dev/null 2>&1; do
    sleep 0.1
  done
  DISPLAY=:98 "${srcdir}/tdm_installer.linux64" --unattended

  rm "${srcdir}/tdm_installer.linux64" "${srcdir}/"tdm_installer_*.log
  mkdir -p "${pkgdir}/usr/share/games/thedarkmod/" "${pkgdir}/usr/bin"
  mv "${srcdir}/"* "${pkgdir}/usr/share/games/thedarkmod/"
  echo '#!/bin/bash' > "${pkgdir}/usr/bin/thedarkmod"
  echo '[[ ! -w /usr/share/games/thedarkmod || ! -w /usr/share/games/thedarkmod/fms ]] && echo "##" && echo "To enable mission download run: sudo chown -R $USER /usr/share/games/thedarkmod/" && echo "##" && sleep 4' >> "${pkgdir}/usr/bin/thedarkmod" 
  echo 'cd /usr/share/games/thedarkmod/ && ./thedarkmod.x64 $@' >> "${pkgdir}/usr/bin/thedarkmod"
  chmod +x "${pkgdir}/usr/bin/thedarkmod"

  # Extract icon
  _tmp=$(mktemp -d)
  cd ${_tmp}
  7z x "${pkgdir}/usr/share/games/thedarkmod/TheDarkModx64.exe"
  convert .rsrc/ICON/12.ico -thumbnail 32x32 -alpha on -background none -flatten "${pkgdir}/usr/share/games/thedarkmod/icon.png"
  rm -r ${_tmp}

  mkdir -p "${pkgdir}/usr/share/applications" 
  _desktop="${pkgdir}/usr/share/applications/thedarkmod.desktop"
  echo '[Desktop Entry]' > ${_desktop}
  echo 'Type=Application' >> ${_desktop}
  echo "Name=The Dark Mod ${pkgver}" >> ${_desktop}
  echo "Comment=${pkgdesc}" >> ${_desktop}
  echo 'Exec=thedarkmod' >> ${_desktop}
  echo "Icon=/usr/share/games/thedarkmod/icon.png" >> ${_desktop}
  echo 'Terminal=false' >> ${_desktop}
  echo 'Categories=Games;ActionGame;' >> ${_desktop}

  echo "###############################################"
  echo "To enable mission download execute:"
  echo 'sudo chown -R $USER /usr/share/games/thedarkmod'
  echo "###############################################"
} 

