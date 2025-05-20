# Maintainer: oech3
# Maintainer: tiziodcaio
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgname=zoom-system-qt
pkgver=6.4.10.2027
pkgrel=1
pkgdesc="Zoom Workspace client (system runtimes)"
arch=('x86_64')
license=('LicenseRef-zoom')
url="https://zoom.us/"
depends=(ocl-icd ffmpeg mpg123
	quazip-qt5 qt5-{base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative}
)
makedepends=(patchelf binutils)
optdepends=('qt5-wayland'
	'qt5-webengine: SSO login'
	'xdg-desktop-portal-impl: Screen sharing,etc... for Wayland'
	{chromium,sqlite,vulkan-drivers}': Webview'
	'qt5-'{3d,x11extras,multimedia,imageformats,remoteobjects}': Unused?'
	)
options=(!strip emptydirs)
provides=(zoom)
conflicts=(zoom)
source=("zoom-origin-${pkgver}.pkg.tar.xz::${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz")
b2sums=('35b10151940c1497a44e6dcbca3a650baab4a7e7cec6e385cd4bd9b82941622e995202b39843d7b08e13d37a55706de5dd0e1147515f52d83f65b090092e79c9')

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
	ln -sf /usr/lib/libavformat.so libffmpeg.so* # is vivaldi-ffmpeg-codecs better?
	rm -r libsqlite3.so*
	for f in chrome-sandbox *.{pak,dat,json} lib{EGL,GLESv2,vulkan,vk_swiftshader}.so*
		do ln -sf {/usr/lib/chromium/,}$f
	done
}
package() {
	mv opt usr "$pkgdir"
}
