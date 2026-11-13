# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=lody-desktop-bin
_pkgname=lody-desktop
pkgver=0.112.0
pkgrel=1
pkgdesc='Team workspace for the coding agents you already run'
arch=('x86_64')
url='https://lody.ai'
license=('Apache-2.0')
# libnotify, libsecret, libxss, libxtst, util-linux-libs and xdg-utils are
# dlopen()ed by Electron at runtime, so they are not in DT_NEEDED and namcap
# reports them as unneeded. They come from the vendor's own Depends line.
depends=(
  'alsa-lib'
  'at-spi2-core'
  'dbus'
  'gtk3'
  'libcups'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator: system tray support')
provides=("${_pkgname}=$pkgver")
conflicts=("$_pkgname" 'lody' 'lody-bin')
options=('!debug')
source=("${_pkgname}-${pkgver}-amd64.deb::https://updates.lody.ai/production/Lody-${pkgver}-amd64.deb")
sha256sums=('19bf055acec92ae2698f49e6b85eb93d9186a3a057095ef97321953ac7a77211')

prepare() {
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-amd64.deb" -C "${srcdir}" 'data.tar.*'
  local data=("${srcdir}"/data.tar.*)
  install -dm755 "${srcdir}/payload"
  bsdtar --no-same-owner -xf "${data[0]}" -C "${srcdir}/payload"
}

package() {
  # The vendor's /opt/Lody layout is kept as shipped, which is also what the
  # lody and lody-bin AUR packages install, hence the conflicts line above.
  install -dm755 "${pkgdir}/opt"
  cp -a --no-preserve=ownership "${srcdir}/payload/opt/Lody" "${pkgdir}/opt/Lody"

  # Ubuntu-only AppArmor profile, nothing on Arch consumes it.
  rm -f "${pkgdir}/opt/Lody/resources/apparmor-profile"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Lody/lodyDesktop "${pkgdir}/usr/bin/${_pkgname}"

  # The vendor icon ships mode 0600, so only root can read it.
  install -Dm644 "${srcdir}/payload/usr/share/icons/hicolor/512x512/apps/lodyDesktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -Dm644 "${srcdir}/payload/usr/share/applications/ai.lody.desktop.desktop" \
    "${pkgdir}/usr/share/applications/ai.lody.desktop"
  sed -i \
    -e 's|^Exec=/opt/Lody/lodyDesktop|Exec=/usr/bin/lody-desktop|' \
    -e 's|^Icon=lodyDesktop$|Icon=lody-desktop|' \
    "${pkgdir}/usr/share/applications/ai.lody.desktop"

  install -Dm644 "${pkgdir}"/opt/Lody/LICENSE.electron.txt "${pkgdir}"/opt/Lody/LICENSES.chromium.html \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
