# Maintainer: oech3
# Maintainer: tiziodcaio
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgbase=zoom-system-qt
pkgname=(${pkgbase}{,-cef} )
pkgver=6.5.3.2773
pkgrel=2
arch=('x86_64')
license=('LicenseRef-zoom')
url="https://zoom.us/"
depends=(vivaldi-ffmpeg-codecs)
makedepends=(patchelf binutils)
optdepends=('qt5-wayland: zoomus.conf xwayland=false'
  'qt5-webengine: SSO login'
  'xdg-desktop-portal-impl: Screen sharing,etc... for Wayland'
  'qt5-'{3d,x11extras,multimedia,imageformats,remoteobjects}': Unused?'
  ${pkgbase}-cef': zoomus.conf disableCef=false')
options=(!strip emptydirs)
#_cefver=137.0.7151.121
#No good way to get mahor ver of CEF
#strings 'libcef.so' | grep -E 'Chromium|[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
source=("zoom_orig-${pkgver}.pkg.tar.xz::${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz"
#"cef-${_cefver}.tar.bz2::https://cef-builds.spotifycdn.com/cef_binary_137.0.19%2Bg8a1c4ce%2Bchromium-${_cefver}_linux64_minimal.tar.bz2"
)
noextract=(*.tar*) # for small BUILDDIR
sha512sums=('b20d11c7ffb9d664181ebbe1920956394355d51f3feef6d22c00ed29da1c0ff6c0759514644eab9ce95a94796e6b6e75fadae7186271d1b1ea5b919c99c85360')
build() {
  bsdtar -xf zoom_orig-$pkgver.pkg.tar.xz \
    --exclude opt/zoom/cef --exclude opt/zoom/Qt --exclude opt/zoom/translations --exclude opt/zoom/qt.conf \
    --exclude opt/zoom/libOpenCL.so* --exclude opt/zoom/libmpg123.so*
  install -d opt/zoom/Qt/lib # for ZoomWebviewHost

  ln -sf /usr/share/pixmaps/Zoom.png usr/share/pixmaps/*-zoom.png
  cd opt/zoom
  #Remove Qt5 symbol ver and insecure RPATH
  for b in zoom zopen Zoom{Launcher,WebviewHost} aomhost libaomagent.so
    do patchelf --remove-rpath $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
  done
  #Replace bundled libs
  for f in libav{codec,format,util}* libswresample*
    do ln -svf /opt/vivaldi/libffmpeg.so* $f
  done
  ln -sf /usr/lib/libquazip1-qt5.so libquazip.so*
  # dlopen-ed libs are hard to replace.
  # libdvf=libpng+libjpeg+glew+zlib+? onednn~libmkldll? libclDNN~openvino?
}

package_zoom-system-qt() {
  depends+=(ocl-icd mpg123 libxtst
  quazip-qt5 qt5-{base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative})
  provides=(zoom)
  conflicts=(zoom)
  pkgdesc="Zoom Workspace client on system runtime"
  mv opt usr "$pkgdir" # breaks --repackage
}

package_zoom-system-qt-cef(){
  pkgdesc="CEF for vebview of ${pkgbase}"
  depends+=(${pkgbase} sqlite)
  optdepends=(vulkan-driver)
  # Prebuilt libcef.so is not stripped which fills BUILDDIR
  cd "$pkgdir"
  bsdtar -xf "$srcdir"/zoom_orig-${pkgver}.pkg.tar.xz \
    --exclude opt/zoom/cef/libsqlite3.so* --exclude opt/zoom/cef/locales opt/zoom/cef
  bsdtar -xf "$srcdir"/zoom_orig-${pkgver}.pkg.tar.xz opt/zoom/cef/locales/en-US.pak
  ln -sf /opt/vivaldi/libffmpeg.so* opt/zoom/cef/libffmpeg.so*
  echo Please add SUID to /opt/zoom/cef/chrome-sandbox if your kernel does not have namespace sandbox.
}
