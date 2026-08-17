# Maintainer: amgsk <y.amgsk@gmail.com>
pkgname=kizami-bin
_appname=kizami
pkgver=0.3.0
pkgrel=1
pkgdesc="Tray-resident pomodoro timer with a mini window mode"
arch=('x86_64')
url="https://github.com/zabuton-app/kizami"
license=('MIT')
options=('!strip')
provides=('kizami')
conflicts=('kizami')
_appimage="${_appname}-${pkgver}-linux-x86_64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/zabuton-app/kizami/v${pkgver}/LICENSE")
noextract=("${_appimage}")
sha256sums=('c9d375d697c1e7bd559650172862c9e24bd9b3786bc567f46394157b768e4788'
            '34899600608d60479abff088841cd9d60a8552ff3017965da268efc5cffc5178')

prepare() {
  chmod +x "${_appimage}"
  # Extract the full AppImage contents and run from real files instead of a
  # FUSE-mounted squashfs, avoiding decompression overhead on every read.
  rm -rf squashfs-root
  ./"${_appimage}" --appimage-extract > /dev/null
  # Rewrite the whole Exec line: the AppImage desktop entry carries
  # --no-sandbox (AppImages cannot ship a setuid helper), but this package
  # installs chrome-sandbox setuid, so the sandbox works normally.
  sed -i 's|^Exec=.*|Exec=kizami|' squashfs-root/kizami.desktop
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
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/kizami"

  install -Dm644 squashfs-root/kizami.desktop \
    "${pkgdir}/usr/share/applications/kizami.desktop"
  local icon
  for icon in squashfs-root/usr/share/icons/hicolor/*/apps/kizami.png; do
    install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/${icon#squashfs-root/usr/share/icons/}"
  done
  install -Dm644 "LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
