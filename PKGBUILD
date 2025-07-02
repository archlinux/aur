# Maintainer: oech3
# Maintainer: tiziodcaio
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgbase=zoom-system-qt
pkgname=(${pkgbase}{,-cef} )
pkgver=6.5.3.2773
pkgrel=1
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
source=("zoom-origin-${pkgver}.pkg.tar.xz::${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz")
b2sums=('aab928a89ecbab1317fa2fc4c0b01d9c0aff2ecf42890336a9cd863e93cf92c40f7c1617df32469502b159a22b3bcc663351b060de1fa7aec58889a517346a89')

build() {	
  ln -sf /usr/share/pixmaps/Zoom.png usr/share/pixmaps/*-zoom.png
  cd opt/zoom
  #Remove Qt5 symbol ver and insecure RPATH
  for b in zoom zopen Zoom{Launcher,WebviewHost} aomhost libaomagent.so
    do patchelf --remove-rpath $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
  done
  #Replace bundled libs
  rm -r lib{OpenCL,mpg123}.so* translations Qt qt.conf
  for f in libav{codec,format,util}* libswresample*
    do ln -svf /opt/vivaldi/libffmpeg.so* $f
  done
  mkdir -p Qt/lib # for ZoomWebviewHost
  ln -sf /usr/lib/libquazip1-qt5.so libquazip.so
  # dlopen-ed libs are hard to replace.
  # libdvf=libpng+libjpeg+glew+zlib+? onednn~libmkldll? libclDNN~openvino?

  cd cef #Updating CEF(https://cef-builds.spotifycdn.com/index.html) seems impossible. ABI?
  mv locales/en-US.pak .;rm -r locales/*;mv en-US.pak locales # for ZoomWebviewHost
  ln -sf /opt/vivaldi/libffmpeg.so.7.4 libffmpeg.so*
  rm -r libsqlite3.so*
  for f in chrome-sandbox *.{pak,dat,json} lib{EGL,GLESv2,vulkan,vk_swiftshader}.so*
    do ln -sf {/usr/lib/chromium/,}$f
  done
}

package_zoom-system-qt() {
  depends+=(ocl-icd mpg123 libxtst
  quazip-qt5 qt5-{base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative})
  provides=(zoom)
  conflicts=(zoom)
  pkgdesc="Zoom Workspace client on system runtime"
  mv opt usr "$pkgdir" # breaks --repackage
  mv "$pkgdir"/opt/zoom/cef "$srcdir"
}

package_zoom-system-qt-cef(){
  pkgdesc="Webview for zoom-system-qt"
  depends+=(${pkgbase} chromium sqlite)
  optdepends=(vulkan-driver)
  install -d "$pkgdir"/opt/zoom
  mv cef "$pkgdir"/opt/zoom
}
