# Maintainer: R3dWolfie <arui939@gmail.com>
pkgname=r3dvoice-bin
_appname=R3DVoice
pkgver=0.15.6
pkgrel=1
pkgdesc="Discord-style low-latency voice, video & screenshare for gamers (Electron + LiveKit)"
arch=('x86_64')
url="https://github.com/R3dWolfie/R3DVoice"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'nss' 'alsa-lib' 'hicolor-icon-theme')
optdepends=('pipewire: screenshare audio capture'
            'libpulse: system audio capture')
provides=('r3dvoice')
conflicts=('r3dvoice')
options=('!strip')
source=("${_appname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/R3DVoice.AppImage")
# Filled in by the release step (makepkg -g). AppImage is an ELF, not an archive.
noextract=("${_appname}-${pkgver}.AppImage")
sha256sums=('99699b38ec3dd1a18f60ca3f9c9fe3d3a2dd1ceb67484817b493305ab462d94c')

prepare() {
  chmod +x "${_appname}-${pkgver}.AppImage"
  "./${_appname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  # App payload → /opt (the extracted AppImage bundles its own Electron).
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"
  # --appimage-extract leaves dirs mode 700; make the whole tree world
  # readable + traversable (dirs/executables get +x, data files don't).
  chmod -R a+rX "${pkgdir}/opt/${pkgname}"
  # AppImage-only bits we don't want at /opt (we ship our own launcher/desktop).
  rm -f "${pkgdir}/opt/${pkgname}/AppRun" \
        "${pkgdir}/opt/${pkgname}/.DirIcon" \
        "${pkgdir}/opt/${pkgname}/r3dvoice.png" \
        "${pkgdir}/opt/${pkgname}/r3dvoice.desktop"

  # Electron's sandbox helper must be setuid-root.
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

  # Launcher wrapper — R3DVOICE_DISABLE_UPDATER makes the app defer updates to
  # pacman/yay (it can't overwrite a root-owned /opt install anyway).
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/r3dvoice" <<EOF
#!/bin/sh
export R3DVOICE_DISABLE_UPDATER=1
exec /opt/${pkgname}/r3dvoice "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/r3dvoice"

  # Desktop entry (Exec via the wrapper, not the AppImage AppRun).
  install -Dm644 squashfs-root/r3dvoice.desktop "${pkgdir}/usr/share/applications/r3dvoice.desktop"
  sed -i -e 's|^Exec=.*|Exec=r3dvoice %U|' \
         -e 's|^Icon=.*|Icon=r3dvoice|' \
         "${pkgdir}/usr/share/applications/r3dvoice.desktop"

  # Icons — install whatever sizes the AppImage actually ships (the set varies
  # by electron-builder version; skip any missing size instead of aborting).
  local size src
  for size in 16 32 48 64 128 256 512 1024; do
    src="squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/r3dvoice.png"
    # if/then (not `&&`): a missing final size must not make package() return
    # non-zero — that's read as a build failure even though nothing broke.
    if [ -f "$src" ]; then
      install -Dm644 "$src" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/r3dvoice.png"
    fi
  done
}
