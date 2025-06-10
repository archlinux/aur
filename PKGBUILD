# Maintainer: oech3
# Maintainer: tiziodcaio
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgbase=zoom-system-qt
pkgname=(${pkgbase}{,-cef} )
pkgver=6.4.13.2309
pkgrel=1
arch=('x86_64')
license=('LicenseRef-zoom')
url="https://zoom.us/"
makedepends=(patchelf binutils)
optdepends=('qt5-wayland: zoomus.conf xwayland=false'
	'qt5-webengine: SSO login'
	'xdg-desktop-portal-impl: Screen sharing,etc... for Wayland'
	'qt5-'{3d,x11extras,multimedia,imageformats,remoteobjects}': Unused?'
	${pkgbase}-cef': zoomus.conf disableCef=false')
options=(!strip emptydirs)
provides=(zoom)
conflicts=(zoom)
source=("zoom-origin-${pkgver}.pkg.tar.xz::${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz")
b2sums=('19aeebe65e639838a7afff244c9fc92a7d63dc8e105b334c904bdef071e66b924b167515ca804dfd0c9e80fdd1de99a6d7410a39488669d2c5e39fb180094f0b')

build() {	
	ln -sf /usr/share/pixmaps/Zoom.png usr/share/pixmaps/*-zoom.png
	cd opt/zoom
	#Remove Qt5 symbol ver and insecure RPATH
	for b in zoom zopen Zoom{Launcher,WebviewHost} aomhost libaomagent.so
		do patchelf --remove-rpath $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
	done
	#Replace bundled libs
	rm -r lib{OpenCL,av*,mpg123,swresample}.so* translations Qt qt.conf
	mkdir -p Qt/lib # for ZoomWebviewHost
	ln -sf /usr/lib/libquazip1-qt5.so libquazip.so
	#libdvf=libpng+libjpeg+glew+zlib+? onednn~libmkldll? libclDNN~openvino?

	cd cef #Updating CEF(https://cef-builds.spotifycdn.com/index.html) seems impossible. ABI?
	mv locales/en-US.pak .;rm -r locales/*;mv en-US.pak locales # for ZoomWebviewHost
	ln -sf /opt/vivaldi/libffmpeg.so.7.4 libffmpeg.so*
	rm -r libsqlite3.so*
	for f in chrome-sandbox *.{pak,dat,json} lib{EGL,GLESv2,vulkan,vk_swiftshader}.so*
		do ln -sf {/usr/lib/chromium/,}$f
	done
}

package_zoom-system-qt() {
  depends=(ocl-icd ffmpeg mpg123
  quazip-qt5 qt5-{base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative})
  pkgdesc="Zoom Workspace client on system runtime"
  mv opt usr "$pkgdir" # breaks --repackage
  mv "$pkgdir"/opt/zoom/{ZoomWebviewHost,cef} .
  
}

package_zoom-system-qt-cef(){
  pkgdesc="Webview for zoom-system-qt"
  depends=(${pkgbase} chromium sqlite vivaldi-ffmpeg-codecs )
  optdepends=(vulkan-driver)
  install -d "$pkgdir"/opt/zoom
  mv ZoomWebviewHost cef "$pkgdir"/opt/zoom
}
