# Maintainer: Dario Klingenberg <dario.klingenberg at web.de>
pkgname=go-cafe-app
pkgver=1.2.18
pkgrel=1
pkgdesc='Native Go client for Fox Weiqi'
arch=('x86_64')
url='https://github.com/go-cafe-app/app'
# Upstream publishes binaries and documentation only; no licence file is provided.
license=('custom')
depends=('alsa-lib' 'gtk3' 'libsecret')
optdepends=('gnome-keyring: remember server passwords in the desktop keyring')
options=(!strip)
source_x86_64=("${url}/releases/download/v${pkgver}/GoCafe-${pkgver}-x86_64.AppImage")
sha256sums_x86_64=('96371a9523454efa9161453fa675e7c1dcb2ab14cebb330051155a2b32c3ef0e')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x "GoCafe-${pkgver}-x86_64.AppImage"
  ./"GoCafe-${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null
}

check() {
  local appimage_version
  appimage_version=$(sed -n 's/^X-AppImage-Version=//p' \
    "${srcdir}/squashfs-root/usr/share/applications/gocafe.desktop")

  if [[ ${appimage_version} != "${pkgver}" ]]; then
    printf 'Version mismatch: PKGBUILD has %s, AppImage has %s\n' \
      "${pkgver}" "${appimage_version:-unknown}" >&2
    return 1
  fi
}

package() {
  # Bundle, including Flutter engine, plugins and data files.
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/squashfs-root/AppRun" "${pkgdir}/opt/${pkgname}/"
  install -dm755 "${pkgdir}/opt/${pkgname}/usr"
  cp -a "${srcdir}/squashfs-root/usr/bin" "${pkgdir}/opt/${pkgname}/usr/"
  cp -a "${srcdir}/squashfs-root/usr/lib" "${pkgdir}/opt/${pkgname}/usr/"

  # Use the distribution's libsecret rather than the bundled copy.
  rm -f "${pkgdir}/opt/${pkgname}/usr/lib/libsecret-1.so.0"

  # AppRun resolves symlinks, so this finds the bundle in /opt.
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/gocafe"
  ln -s 'gocafe' "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/gocafe.desktop" \
    "${pkgdir}/usr/share/applications/gocafe.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/gocafe.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gocafe.png"

  # Third-party notices for the bundled artwork and Flutter components.
  install -Dm644 "${srcdir}/squashfs-root/usr/bin/data/flutter_assets/assets/board_themes/THIRD-PARTY.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/board-themes-THIRD-PARTY.md"
  install -Dm644 "${srcdir}/squashfs-root/usr/bin/data/flutter_assets/assets/sounds/THIRD-PARTY.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/sounds-THIRD-PARTY.md"
  gzip -dc "${srcdir}/squashfs-root/usr/bin/data/flutter_assets/NOTICES.Z" \
    >"${srcdir}/NOTICES"
  install -Dm644 "${srcdir}/NOTICES" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICES"
}
