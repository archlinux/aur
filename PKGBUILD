# Maintainer: oech3
# Contributor: tiziodcaio
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgname=zoom-system-qt
pkgver=6.4.6.1370
pkgrel=2
pkgdesc="Zoom Workspace client with system libraries"
arch=('x86_64')
license=('LicenseRef-zoom')
url="https://zoom.us/"
depends=(ocl-icd ffmpeg mpg123
	quazip-qt5 qt5-{base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative}
)
makedepends=(patchelf binutils)
optdepends=('qt5-wayland: Wayland support'
	'qt5-webengine: SSO login'
	'xdg-desktop-portal-impl: Screen sharing,etc... for Wayland'
	{chromium,sqlite}': Webview'
	'qt5-'{3d,x11extras,multimedia,imageformats,remoteobjects}': Unknown. Bundled in original.'
	)
options=(!strip emptydirs)
provides=(zoom)
conflicts=(zoom)
source=("zoom-origin-${pkgver}.pkg.tar.xz::${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz")
b2sums=('758a44e3e2e57bfcc5d1bee16c8fc081806f7a3785caab7c8662d157450c3150d0ec8fc11aa8e0178ba2d272370147fe4176f53b09ceadb5f3e1d3bac81e5b01')

build() {	
	cd opt/zoom
	#Remove Qt5 symbol ver and insecure RPATH
	for b in zoom zopen ZoomLauncher ZoomWebviewHost aomhost libaomagent.so
		do patchelf --remove-rpath $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
	done
	#Replace bundled libs
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
