# Maintainer: oech3
# Contributor: tiziodcaio
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgname=zoom-system-qt
pkgver=6.4.5.1259
pkgrel=1
pkgdesc="Zoom Workspace client with system libraries"
arch=('x86_64')
license=('LicenseRef-zoom')
url="https://zoom.us/"

depends=(ocl-icd ffmpeg mpg123
	quazip-qt5 qt5-{base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative}
) #wireless_tools for getbssid.sh?
makedepends=(patchelf binutils)
optdepends=('qt5-wayland: Wayland support'
	'qt5-webengine: SSO login'
	'xdg-desktop-portal-impl: Screen sharing,etc... for Wayland'
	{chromium,sqlite}': Webview'
	'qt5-'{3d,x11extras,multimedia,imageformats,remoteobjects}': Unknown. Bundled in original.'
	)
provides=(zoom)
conflicts=(zoom)
source=("${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('f11a8d87ead4ef59c90db543f47bb0e5a3a7d0ba518e246a49b033b94283100a40d143575b9c43d15f193bbff26eb0cd47ca511320b4925795ee30b2da128e56')
options=(!strip emptydirs)
build() {	
	cd opt/zoom
	echo Removing Qt5 symbol version and RPATH
	for b in zoom zopen ZoomLauncher ZoomWebviewHost aomhost libaomagent.so
		do patchelf --remove-rpath $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
	done
	echo Replacing bundled libs
	rm -r {libOpenCL.so.1,libav*,libmpg123.so,libswresample.so.4,translations,Qt,qt.conf,version.txt}
	mkdir -p Qt/lib #for ZoomWebviewHost
	ln -sf /usr/lib/libquazip1-qt5.so libquazip.so

	#libdvf=libpng+libjpeg+glew+zlib+? onednn~libmkldll? libclDNN~openvino?
	cd cef #Updating CEF(https://cef-builds.spotifycdn.com/index.html) seems impossible. ABI?
	mv locales{,-b};mkdir locales;mv locales{-b,}/en-US.pak;rm -r locales-b #needed for ZoomWebviewHost
	ln -sf /usr/lib/libavformat.so libffmpeg.so*
	rm -r libsqlite3.so* chrome-sandbox
	for f in *.{pak,dat,json} {libEGL,libGLESv2,libvulkan,libvk_swiftshader}.so*
		do ln -sf {/usr/lib/chromium/,}$f
	done
}
package() {
	mv opt usr "$pkgdir"
}
