# Maintainer: oech3
# Maintainer: tiziodcaio
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgname=zoom-system-qt
pkgver=6.5.11.4015
pkgrel=9
arch=('x86_64')
license=('LicenseRef-zoom')
url=https://zoom.us/
makedepends=(patchelf binutils)
optdepends=(
  'qt5-webengine: SSO login'
  'xdg-desktop-portal-impl: Screen sharing on Wayland'
  qt5-{wayland,3d,multimedia,imageformats,remoteobjects} ffmpeg
  chromium chromium-ffmpeg-legacy vulkan-icd-loader
)
options=(!strip emptydirs)
source=("zoom_orig-${pkgver}.pkg.tar.xz::${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz")
noextract=(${source[0]%::*}) # for small BUILDDIR
sha512sums=('c150fa1469b9f1bec922a2b47a89a9ebab322427303d37936b364c8b21f2f281debbaa265f52458ea8642df16f49790f8d82fbcbb7c7e947a331f8f91a85e302')
package() {
  depends+=(ocl-icd mpg123 libxtst sqlite
  quazip-qt5 qt5-{x11extras,base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative})
  provides=(zoom)
  conflicts=(zoom)
  pkgdesc="Zoom Workspace on system runtime"

  tar -C "$pkgdir" -xf "${source[0]%::*}" --exclude .* \
    --exclude opt/zoom/Qt --exclude opt/zoom/qt.conf --exclude opt/zoom/translations \
    --exclude opt/zoom/libOpenCL.so* --exclude opt/zoom/libmpg123.so* \
    --exclude opt/zoom/libavcodec.so* --exclude opt/zoom/libavformat.so* --exclude opt/zoom/libavutil.so* --exclude opt/zoom/libswresample.so* \
    --exclude opt/zoom/cef/libsqlite3.so* --exclude opt/zoom/cef/libvulkan.so*

  cd "$pkgdir"/opt/zoom
  install -d Qt/lib # for CEF
  #Remove Qt5 symbol ver and insecure RPATH
  for b in zoom zopen Zoom{Launcher,WebviewHost} aomhost libaomagent.so
    do patchelf --remove-rpath $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
  done
  ln -sf /usr/lib/libquazip1-qt5.so libquazip.so*
  cd cef
  ln -sf /usr/lib/chromium/chrome-sandbox chrome_sandbox
  install -d glibc-hwcaps/x86-64-v2
  ln -sf /usr/lib/chromium/lib{EGL,GLESv2,vk_swiftshader}.so -t glibc-hwcaps/x86-64-v2
  ln -sf /usr/lib/libffmpeg.so.61 glibc-hwcaps/x86-64-v2/libffmpeg.so
}
