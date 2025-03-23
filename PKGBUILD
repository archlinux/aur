# Maintainer: oech3
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgname=zoom-system-qt
pkgver=6.4.0.471
pkgrel=1
pkgdesc="(Experimental) Zoom Workspace client with system libraries"
arch=('x86_64')
license=('custom:commercial')
url="https://zoom.us/"
_cefpkg=chromium
_cefdir=/usr/lib/${_cefpkg}

depends=(ocl-icd ffmpeg mpg123 sqlite ${_cefpkg}
	quazip-qt5 qt5-{base,graphicaleffects,quickcontrols,quickcontrols2,svg,declarative}
	qt5-{3d,x11extras,multimedia,imageformats,remoteobjects} #unneeded? buldled in original
) #wireless_tools?
makedepends=(patchelf binutils)
optdepends=('qt5-wayland: Wayland support'
	'qt5-webengine: SSO login'
	'xdg-desktop-portal-impl: Portals for screen sharing,etc... for Wayland')
provides=(zoom)
conflicts=(zoom)
source=("${url}client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('098e70438b38a6599a4c70d69edac5256fb01ca96b2d1dedf0e07ed40873c0e8a878e88c2a7fe96eebe58cd8cff45302a5b7dd08edc86f0396ef086daa5152b0')
build() {	
	cd opt/zoom
	echo Fixing for wayland
	ln -svf zoom ZoomLauncher

	echo Removing Qt5 symbol version and RPATH
	for b in zoom zopen ZoomWebviewHost aomhost libaomagent.so
	do patchelf --remove-rpath $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
	done

	echo Replaceing bundled libs
	rm -r {libOpenCL.so.1,libav*,libmpg123.so,libswresample.so.4,translations,Qt,qt.conf}
	mkdir -p Qt/lib #needed to run ZoomWebviewHost
	ln -sf /usr/lib/libquazip1-qt5.so libquazip.so
	cd cef
	rm -r locales libsqlite3.so.0
	#Stripped CEF(https://cef-builds.spotifycdn.com/index.html) is small.
	for f in *;do if [ -e "${_cefdir}/$f" ];then ln -sf "$_cefdir/$f" $f;fi;done
}
package() {
    cp -dpr --no-preserve=ownership opt usr "$pkgdir"
}
