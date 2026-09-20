# Maintainer: darthmaul86 <pitepana@gmail.com>

_pkgname=mister-companion
pkgname=mister-companion
pkgver=r415.ae87ce3
pkgrel=1
pkgdesc="Companion utility for managing MiSTer FPGA setups (source build; see mister-companion-bin for Cloud/Scraper support)"
arch=('any')
url="https://github.com/Anime0t4ku/mister-companion"
license=('GPL-2.0-only')
depends=('python' 'python-requests' 'python-paramiko' 'python-psutil' 'python-pyqt6' 'python-websocket-client' 'python-pillow')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/Anime0t4ku/mister-companion.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  cp -r * "${pkgdir}/usr/share/${_pkgname}/"

  # Δημιουργία wrapper script που προετοιμάζει τον φάκελο στο ~/.config
  install -dm755 "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
CONF_DIR="\${XDG_CONFIG_HOME:-\$HOME/.config}/${_pkgname}"
mkdir -p "\$CONF_DIR"

# Αντιγραφή των απαραίτητων αρχείων/δομών αν δεν υπάρχουν στο ~/.config
if [ ! -f "\$CONF_DIR/main.py" ]; then
  cp -rn /usr/share/${_pkgname}/${_pkgname}/* "\$CONF_DIR/"
fi

cd "\$CONF_DIR"
exec python main.py "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${_pkgname}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=MiSTer Companion
Comment=Companion utility for managing and syncing MiSTer FPGA setups
Exec=mister-companion
Icon=mister-companion
Terminal=false
Type=Application
Categories=Utility;Settings;
EOF
}
