pkgname=jayjay-appimage
pkgver=0.3.24
pkgrel=1
pkgdesc="Native desktop client for Jujutsu version control"
arch=('x86_64' 'aarch64')
url="https://jayjay.hewig.dev/"
license=('BUSL-1.1')
depends=('fontconfig' 'fuse3' 'gcc-libs' 'libxcb' 'vulkan-driver' 'vulkan-icd-loader' 'wayland' 'xdg-utils')
optdepends=('xdg-desktop-portal: file picker and opening links'
            'gnome-keyring: saving credentials')
options=('!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/hewigovens/jayjay/v${pkgver}/LICENSE")
source_x86_64=("jayjay-gpui-x86_64.AppImage::https://github.com/hewigovens/jayjay/releases/download/v${pkgver}/jayjay-gpui-x86_64.AppImage")
source_aarch64=("jayjay-gpui-aarch64.AppImage::https://github.com/hewigovens/jayjay/releases/download/v${pkgver}/jayjay-gpui-aarch64.AppImage")
noextract=('jayjay-gpui-x86_64.AppImage' 'jayjay-gpui-aarch64.AppImage')
sha256sums=('5450f4b263bbbfc9b90e843051f739a20b1484d142a1ea7a7a2d37899d6e2578')
sha256sums_x86_64=('77f4b2585c276b11245ed9e48ae743a6765af7bf0d5381292f73b81263045007')
sha256sums_aarch64=('564a45c9f1d71025281b9f46bf9d8e43afff29e23f41fe13e9228be6930cbd49')

prepare() {
  local _appimage="jayjay-gpui-${CARCH}.AppImage"
  rm -rf "${srcdir}/squashfs-root"
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract >/dev/null
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  local _appimage="jayjay-gpui-${CARCH}.AppImage"
  local _metainfo
  _metainfo=$(find squashfs-root -path '*/share/metainfo/dev.hewig.JayJay.metainfo.xml' -print -quit)
  test -n "${_metainfo}"
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/JayJay.AppImage"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 squashfs-root/dev.hewig.JayJay.desktop \
    "${pkgdir}/usr/share/applications/dev.hewig.JayJay.desktop"
  install -Dm644 "${_metainfo}" \
    "${pkgdir}/usr/share/metainfo/dev.hewig.JayJay.metainfo.xml"
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -a squashfs-root/usr/share/icons/. "${pkgdir}/usr/share/icons/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/JayJay.AppImage" "${pkgdir}/usr/bin/jayjay-gpui"
  ln -s "/opt/${pkgname}/JayJay.AppImage" "${pkgdir}/usr/bin/jayjay"
}
