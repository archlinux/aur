# Maintainer: oech3
# Maintainer: tiziodcaio
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgbase=zoom-system-qt
pkgname=(${pkgbase}{,-cef} )
pkgver=6.5.11.4015
pkgrel=2
arch=('x86_64')
license=('LicenseRef-zoom')
url="https://zoom.us/"
makedepends=(patchelf binutils)
optdepends=('qt5-wayland: zoomus.conf xwayland=false'
  'qt5-webengine: SSO login'
  'xdg-desktop-portal-impl: Screen sharing,etc... for Wayland'
  qt5-{3d,x11extras,multimedia,imageformats,remoteobjects} ffmpeg
  ${pkgbase}-cef': zoomus.conf disableCef=false')
options=(!strip emptydirs)
source=("zoom_orig-${pkgver}.pkg.tar.xz::${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz")
noextract=(zoom_orig-${pkgver}.pkg.tar.xz) # for small BUILDDIR
sha512sums=('c150fa1469b9f1bec922a2b47a89a9ebab322427303d37936b364c8b21f2f281debbaa265f52458ea8642df16f49790f8d82fbcbb7c7e947a331f8f91a85e302')
package_zoom-system-qt() {
  depends+=(ocl-icd mpg123 libxtst
  quazip-qt5 qt5-{base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative})
  provides=(zoom)
  conflicts=(zoom)
  pkgdesc="Zoom Workspace client on system runtime"

  cd "$pkgdir"
  tar -xf "${srcdir}/${source[0]%::*}" --exclude .* \
    --exclude opt/zoom/cef --exclude opt/zoom/Qt --exclude opt/zoom/qt.conf --exclude opt/zoom/translations \
    --exclude opt/zoom/libOpenCL.so* --exclude opt/zoom/libmpg123.so* \
    --exclude opt/zoom/libavcodec.so* --exclude opt/zoom/libavformat.so* --exclude opt/zoom/libavutil.so* --exclude opt/zoom/libswresample.so*

  install -d opt/zoom/Qt/lib # for ZoomWebviewHost
  cd "$pkgdir"/opt/zoom
  #Remove Qt5 symbol ver and insecure RPATH
  for b in zoom zopen Zoom{Launcher,WebviewHost} aomhost libaomagent.so
    do patchelf --remove-rpath $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
  done
  ln -sf /usr/lib/libquazip1-qt5.so libquazip.so*
  # dlopen-ed? libdvf=libpng+libjpeg+glew+zlib+? onednn~libmkldll? libclDNN~openvino?
}

package_zoom-system-qt-cef(){
  pkgdesc="CEF for vebview of ${pkgbase}"
  depends+=(${pkgbase} sqlite)
  optdepends=(chromium chromium-ffmpeg-legacy)
  cd "$pkgdir"
  tar -xf "${srcdir}/${source[0]%::*}" \
    --exclude opt/zoom/cef/libsqlite3.so* --exclude opt/zoom/cef/locales opt/zoom/cef
  tar -xf "${srcdir}/${source[0]%::*}" opt/zoom/cef/locales/en-US.pak
#_cefver=137.0.7151.121
#No good way to get major ver of CEF.
#strings 'libcef.so' | grep -E 'Chromium|[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
#Also aac is needed
  ln -sf /usr/lib/chromium/chrome-sandbox "$pkgdir"/opt/zoom/cef/chrome_sandbox
  install -d "$pkgdir"/opt/zoom/cef/glibc-hwcaps/x86-64-v2
  ln -svf /usr/lib/chromium/lib{{EGL,GLESv2,vk_swiftshader}.so,vulkan.so.1} -t "$pkgdir"/opt/zoom/cef/glibc-hwcaps/x86-64-v2
  ln -svf /usr/lib/libffmpeg.so.61 "$pkgdir"/opt/zoom/cef/glibc-hwcaps/x86-64-v2/libffmpeg.so
}
