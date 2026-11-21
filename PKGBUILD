# Maintainer: Luke Bubar <luke@coldmail.xyz>
# Upstream: https://github.com/ChupathingyCE/chupathingyce
pkgname=chupathingyce-bin
pkgver=0.9.1a
pkgrel=1
pkgdesc='Halo: Combat Evolved native port for modern systems (prebuilt Linux release)'
arch=('x86_64')
url='https://github.com/ChupathingyCE/chupathingyce'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgl' 'libx11' 'libxext')
optdepends=('pipewire: audio support' 'libpulse: PulseAudio support' 'wayland: native Wayland support')
provides=('chupathingyce')
conflicts=('chupathingyce' 'chupathingyce-git')
options=('!strip')
source=("chupathingyce-${pkgver}-linux64.zip::${url}/releases/download/v${pkgver}/chupathingyce-linux64-release.zip")
sha256sums=('334d28cb55dfb23c5062e9d44aeae5659e9bf5427fe94b07f6707e793e01f198')

prepare() {
  mkdir -p "${srcdir}/payload"
  bsdtar -xf "${srcdir}/chupathingyce-${pkgver}-linux64.zip" -C "${srcdir}/payload"
}

package() {
  local executable payload_root
  executable="$(find "${srcdir}/payload" -type f -name chupathingy -print -quit)"
  if [[ -z "$executable" ]]; then
    printf 'ERROR: Chupathingy executable not found in upstream ZIP\n' >&2
    return 1
  fi
  payload_root="$(dirname "$executable")"

  install -dm755 "${pkgdir}/opt/chupathingyce" "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/applications"
  cp -a "${payload_root}/." "${pkgdir}/opt/chupathingyce/"
  chmod 755 "${pkgdir}/opt/chupathingyce/chupathingy"
  # Upstream's supported package-manager mode: no in-app self-updates,
  # user game data under XDG_DATA_HOME/chupathingyce.
  touch "${pkgdir}/opt/chupathingyce/packaged"

  cat > "${pkgdir}/usr/bin/chupathingyce" <<'SH'
#!/bin/sh
cd /opt/chupathingyce || exit 1
exec ./chupathingy "$@"
SH
  chmod 755 "${pkgdir}/usr/bin/chupathingyce"

  cat > "${pkgdir}/usr/share/applications/chupathingyce.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=ChupathingyCE
Comment=Halo: Combat Evolved native port
Exec=chupathingyce
Terminal=false
Categories=Game;ActionGame;
DESKTOP
}
