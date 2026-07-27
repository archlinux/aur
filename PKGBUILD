# Maintainer: amgsk <y.amgsk@gmail.com>
pkgname=meguri-bin
_appname=Meguri
pkgver=0.2.6
pkgrel=2
pkgdesc="Local video and image browser with thumbnails, search, and playback"
arch=('x86_64')
url="https://github.com/zabuton-app/meguri"
license=('MIT')
options=('!strip')
provides=('meguri')
conflicts=('meguri')
_appimage="${_appname}-${pkgver}-linux-x86_64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/zabuton-app/meguri/v${pkgver}/LICENSE")
noextract=("${_appimage}")
sha256sums=('9d545d97baef2c8dfaea7aa2c8e28985f0a47d5f0186ed3b98edaf4a232feeb4'
            '34899600608d60479abff088841cd9d60a8552ff3017965da268efc5cffc5178')

prepare() {
  chmod +x "${_appimage}"
  # Extract the full AppImage contents and run from real files instead of a
  # FUSE-mounted squashfs. The FUSE indirection made every read (app.asar,
  # bundled ffmpeg/ffprobe spawned per seek preview) go through decompression,
  # causing noticeable runtime sluggishness.
  rm -rf squashfs-root
  ./"${_appimage}" --appimage-extract > /dev/null
  # Rewrite the whole Exec line: the AppImage desktop entry carries
  # --no-sandbox (AppImages cannot ship a setuid helper), but this package
  # installs chrome-sandbox setuid, so the sandbox works normally.
  sed -i 's|^Exec=.*|Exec=meguri %U|' squashfs-root/meguri.desktop
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"

  # The squashfs image stores directories as 0700; normalize so non-root
  # users can read the installed tree (keeps existing execute bits via X).
  chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname}"

  # Chromium's setuid sandbox helper; required when unprivileged user
  # namespaces are unavailable (AppRun falls back to --no-sandbox otherwise).
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/meguri"
  # Backward-compatibility symlink for anything launching the old AppImage
  # path directly. AppRun is a plain shell wrapper, so plain launches keep
  # working (AppImage runtime flags such as --appimage-extract do not).
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/opt/${pkgname}/${_appname}.AppImage"

  install -Dm644 squashfs-root/meguri.desktop \
    "${pkgdir}/usr/share/applications/meguri.desktop"
  local icon
  for icon in squashfs-root/usr/share/icons/hicolor/*/apps/meguri.png; do
    install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/${icon#squashfs-root/usr/share/icons/}"
  done
  install -Dm644 "LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
