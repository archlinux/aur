# Maintainer: dim-ghub <59436063+dim-ghub@users.noreply.github.com>

pkgname=playvortex-appimage
_appid=io.playvortex.Vortex
pkgver=0.9.6
pkgrel=1
pkgdesc="Play and create games on Vortex (playvortex.io; AppImage, self-updating)"
arch=('x86_64')
url="https://playvortex.io"
license=('LicenseRef-proprietary')
# X11/udev libs are bundled inside the AppImage.
depends=(
  'alsa-lib'
  'fuse3'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'pacman'  # vercmp, used by the launcher
  'vulkan-icd-loader'
)
optdepends=('wayland: native Wayland support')
provides=('playvortex')
conflicts=('playvortex' 'playvortex-bin')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::https://cdn.playvortex.io/releases/client/${pkgver}/Vortex-linux"
        'playvortex.sh')
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('707cdb8f1e6f548bc8612c0693094cc748c9ac8f74f18caad03ac3b4a80f8475'
            'ef2c6c9b7534fec3e42475533476470a9024ea62ca5d12a9de096e6c3bc6c92e')

prepare() {
  rm -rf squashfs-root
  chmod +x "${pkgname}-${pkgver}.AppImage"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  # Pristine seed copy; the launcher copies it to a user-writable location
  # so the game's built-in updater can replace it.
  install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/playvortex/Vortex.AppImage"
  echo "${pkgver}" > "${pkgdir}/opt/playvortex/version"

  install -Dm755 playvortex.sh "${pkgdir}/usr/bin/playvortex"

  cd squashfs-root
  install -Dm644 "usr/share/applications/${_appid}.desktop" \
    "${pkgdir}/usr/share/applications/${_appid}.desktop"
  sed -i 's|^Exec=.*|Exec=playvortex %u|' "${pkgdir}/usr/share/applications/${_appid}.desktop"

  install -Dm644 "usr/share/icons/hicolor/512x512/apps/${_appid}.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appid}.png"
}
