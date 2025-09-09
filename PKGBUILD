

pkgname=zoom-native
pkgver=6.5.11.4015
pkgrel=1
pkgdesc="Replace Zoom Workspace's libs by system copies"
arch=(any)
url=https://zoom.us/
optdepends=(
  'qt5-webengine: SSO login'
  'xdg-desktop-portal-impl: Screen sharing on Wayland'
  qt5-{wayland,3d,multimedia,imageformats,remoteobjects} ffmpeg
  chromium chromium-ffmpeg-legacy vulkan-icd-loader
)
options=(emptydirs) # for CEF
source=(${pkgname}.hook ${pkgname}.sh)
sha256sums=('9f48ca19071e4bf370781f7b339247e291c575511589f7648c29b31ae38f68b4'
            '03100ba443968436b8c1e084dc6df1c3adc85f045c956a4fd9ae0da14923df93')
package(){
  depends=(zoom binutils patchelf
    ocl-icd mpg123 libxtst sqlite
    quazip-qt5 qt5-{x11extras,base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative})
  # CEF things
  install -d "$pkgdir"/opt/zoom/{Qt/lib,cef/glibc-hwcaps/x86-64-v2}
  ln -sf /usr/lib/chromium/lib{EGL,GLESv2,vk_swiftshader}.so -t "$pkgdir"/opt/zoom/cef/glibc-hwcaps/x86-64-v2
  ln -sf /usr/lib/libffmpeg.so.61 "$pkgdir"/opt/zoom/cef/glibc-hwcaps/x86-64-v2/libffmpeg.so
  # Replace libs
  install -Dm644 ${pkgname}.hook -t "$pkgdir"/usr/share/libalpm/hooks
  install -Dm755 ${pkgname}.sh -t "$pkgdir"/opt/zoom
  echo "Recommended to NoExtract=opt/zoom/Qt opt/zoom/translations"
}
