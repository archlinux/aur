

pkgname=zoom-native
pkgver=6.5.11.4015
pkgrel=2
pkgdesc="Replace Zoom Workspace's libs by system copies"
arch=(any)
url=https://zoom.us/
replaces=(zoom-system-qt)
optdepends=(
  'qt5-webengine: SSO login'
  'xdg-desktop-portal-impl: Screen sharing on Wayland'
  qt5-{wayland,3d,multimedia,imageformats,remoteobjects} ffmpeg
  chromium chromium-ffmpeg-legacy vulkan-icd-loader
)
options=(emptydirs) # for CEF
source=(${pkgname}.hook ${pkgname}.sh)
sha256sums=('9f48ca19071e4bf370781f7b339247e291c575511589f7648c29b31ae38f68b4'
            'e7ff3aee3f39d1d0061d0e26551bfa58b6ce393b9f0b3f4cb5c54b6b31734c0c')
package(){
  depends=(zoom binutils patchelf fd
    ocl-icd mpg123 libxtst sqlite
    quazip-qt5 qt5-{x11extras,base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative})
  # CEF things
  install -d "$pkgdir"/opt/zoom/{Qt/lib,cef/glibc-hwcaps/x86-64-v2}
  ln -sf /usr/lib/chromium/lib{EGL,GLESv2,vk_swiftshader}.so -t "$pkgdir"/opt/zoom/cef/glibc-hwcaps/x86-64-v2
  ln -sf /usr/lib/libffmpeg.so.61 "$pkgdir"/opt/zoom/cef/glibc-hwcaps/x86-64-v2/libffmpeg.so
  # Replace libs
  install -Dm644 ${pkgname}.hook -t "$pkgdir"/usr/share/libalpm/hooks
  install -Dm755 ${pkgname}.sh -t "$pkgdir"/opt/zoom
}
