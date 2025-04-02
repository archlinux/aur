# Maintainer: oech3
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgname=zoom-system-qt
pkgver=6.4.3.827
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
	{chromium,sqlite,vivaldi-ffmpeg-codecs}': Webview'
	'qt5-'{3d,x11extras,multimedia,imageformats,remoteobjects}': Unknown. Bundled in original.'
	)
provides=(zoom)
conflicts=(zoom)
source=("${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('749e8879ce3f6260dec95686e30068d2d220c8036992efb110d800d334e7933efaa09fad97b646bfee9aba7fe747aebea6ea540729e3feccee9f679bdf131ddc')
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
	rm -r libsqlite3.so* chrome-sandbox
	ln -sf /opt/vivaldi/libffmpeg.so* libffmpeg.so
	for f in *.{pak,dat,json} {libEGL,libGLESv2,libvulkan,libvk_swiftshader}.so*
		do ln -sf {/usr/lib/chromium/,}$f
	done
}
package() {
	mv opt usr "$pkgdir"
}
