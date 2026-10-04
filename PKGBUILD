# Maintainer: Luca Auer <lolle2000.la@gmail.com>

pkgname=reasonix-studio-bin
_pkgname=reasonix-studio
pkgver=2.27.0
pkgrel=1
pkgdesc='Reasonix Studio - Electron desktop GUI for the DeepSeek-native AI coding agent (repackaged from .deb)'
arch=('x86_64')
url='https://github.com/esengine/DeepSeek-Reasonix'
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'gcc-libs' 'glib2' 'gtk3'
         'hicolor-icon-theme' 'libcups' 'libnotify' 'libsecret' 'libx11'
         'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
         'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nss' 'pango'
         'systemd-libs' 'xdg-utils')
optdepends=('bubblewrap: for agent shell sandbox execution')
provides=('reasonix-studio')
conflicts=('reasonix-studio')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-amd64.deb::${url}/releases/download/studio-v${pkgver}/ReasonixStudio-linux-amd64.deb"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/esengine/DeepSeek-Reasonix/studio-v${pkgver}/LICENSE")
noextract=("${pkgname}-${pkgver}-amd64.deb")
sha256sums=('b1e16db34eee6789b8c5f4b449c86f174e63564e4a827d2a02738b23dee5bc7f'
            'dc024237821ac82056c37f8d82e3be919bd51e39a4529ec12a8ab3e2a346dc4c')

prepare() {
  mkdir -p "${srcdir}/debroot"
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-amd64.deb" -C "${srcdir}/debroot"
  bsdtar -xf "${srcdir}/debroot"/data.tar.* -C "${srcdir}/debroot"
}

package() {
  cd "${srcdir}/debroot"

  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"

  # Install application bundle to /opt/reasonix-studio
  cp -a --no-preserve=ownership "opt/Reasonix Studio" "${pkgdir}/opt/reasonix-studio"
  chmod 755 "${pkgdir}/opt/reasonix-studio"

  # Symlink with space for compatibility with any hardcoded paths
  ln -s reasonix-studio "${pkgdir}/opt/Reasonix Studio"

  # SUID sandbox helper for Electron
  chmod 4755 "${pkgdir}/opt/reasonix-studio/chrome-sandbox"

  # Executable symlinks
  ln -s /opt/reasonix-studio/reasonix-studio-electron "${pkgdir}/usr/bin/reasonix-studio"
  ln -s /opt/reasonix-studio/reasonix-studio-electron "${pkgdir}/usr/bin/reasonix-studio-electron"

  # Desktop file
  install -Dm644 usr/share/applications/reasonix-studio-electron.desktop \
    "${pkgdir}/usr/share/applications/reasonix-studio.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=reasonix-studio %U|' \
    -e 's|^Icon=.*|Icon=reasonix-studio|' \
    -e 's|^StartupWMClass=.*|StartupWMClass=Reasonix Studio|' \
    "${pkgdir}/usr/share/applications/reasonix-studio.desktop"
  ln -s reasonix-studio.desktop "${pkgdir}/usr/share/applications/reasonix-studio-electron.desktop"

  # Icons
  local _icon _dir
  for _icon in usr/share/icons/hicolor/*/apps/reasonix-studio-electron.*; do
    _dir="$(basename "$(dirname "$(dirname "${_icon}")")")"
    install -Dm644 "${_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/$(basename "${_icon}")"
    ln -s "$(basename "${_icon}")" \
      "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/reasonix-studio.${_icon##*.}"
  done

  # Licenses
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [ -f opt/Reasonix\ Studio/LICENSE.electron.txt ]; then
    install -Dm644 opt/Reasonix\ Studio/LICENSE.electron.txt \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  fi
  if [ -f opt/Reasonix\ Studio/LICENSES.chromium.html ]; then
    install -Dm644 opt/Reasonix\ Studio/LICENSES.chromium.html \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
  fi

  # Deliberately not installed: reasonix-studio-update-helper and its polkit policy
  # (io.reasonix.studio.update.policy) — pacman/AUR owns package updates.
}
