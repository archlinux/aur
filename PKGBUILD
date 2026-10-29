pkgname=jayjay-appimage
pkgver=0.3.22
pkgrel=1
pkgdesc='Native desktop client for Jujutsu version control'
arch=('x86_64' 'aarch64')
url='https://jayjay.hewig.dev/'
license=('BUSL-1.1')
depends=('fontconfig' 'fuse2' 'gcc-libs' 'libxcb' 'vulkan-driver' 'vulkan-icd-loader' 'wayland' 'xdg-utils')
optdepends=('xdg-desktop-portal: file picker / opening links'
            'gnome-keyring: save credentials')
options=('!strip')

_installdir=/opt/jayjay

source_x86_64=("jayjay-gpui-x86_64.AppImage::https://github.com/hewigovens/jayjay/releases/download/v${pkgver}/jayjay-gpui-x86_64.AppImage")
source_aarch64=("jayjay-gpui-aarch64.AppImage::https://github.com/hewigovens/jayjay/releases/download/v${pkgver}/jayjay-gpui-aarch64.AppImage")
noextract=("jayjay-gpui-${CARCH}.AppImage")
sha256sums_x86_64=('dd4e5c2b15708fa2d70174865a862fd2b1d864bf40342f37fe4c5b35a2f46df6')
sha256sums_aarch64=('07adc6b04a450b4af6e5fe010ca25218e5ba865f07174c26167fd9e77749102f')

prepare() {
  local _appimage="jayjay-gpui-${CARCH}.AppImage"
  chmod a+x "${_appimage}"
  ./"${_appimage}" --appimage-extract >/dev/null
  sed -i \
    -e "s+^Exec=jayjay-gpui+Exec=${_installdir}/JayJay.AppImage+" \
    -e "s+^Icon=.*+Icon=/usr/share/icons/hicolor/scalable/apps/dev.hewig.JayJay.svg+" \
    squashfs-root/dev.hewig.JayJay.desktop
}

package() {
  local _appimage="jayjay-gpui-${CARCH}.AppImage"
  install -Dm755 "${_appimage}" "${pkgdir}${_installdir}/JayJay.AppImage"
  install -Dm644 squashfs-root/dev.hewig.JayJay.desktop \
    "${pkgdir}/usr/share/applications/dev.hewig.JayJay.desktop"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/dev.hewig.JayJay.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dev.hewig.JayJay.svg"
}
