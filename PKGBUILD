# Maintainer: oech3
# Contributor: netcrusher < tobias AT miglix DOT eu >
# Contributor: Caleb Maclennan <caleb AT alerque DOT com>
# Contributor: Gordian Edenhofer <gordian.edenhofer AT gmail DOT com>
# Contributor: mnabid

pkgname=zoom-system-qt
pkgver=6.4.0.587
pkgrel=1
pkgdesc="(Experimental) Zoom Workspace client with system libraries"
arch=('any')
license=('custom:commercial')
url="https://zoom.us/"
_cefpkg=chromium
_cefdir=/usr/lib/${_cefpkg}

depends=(ocl-icd ffmpeg mpg123 vivaldi-ffmpeg-codecs sqlite ${_cefpkg}
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
sha512sums=('379c623e965022a43c213359d4afa041cc4eca0e85f83a6a59c936e8f3c9478e1129bdce49ee2ce5a7afdee14b9b956698c5fa7c2fbd67c17a0f92794f33d705')
options=(!strip emptydirs)
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
	#libvdf.so=libpng+libjpeg+glew+zlib+?. #onednn-libmkldll-shim?
	cd cef
	rm -r locales libsqlite3.so.0
	#Stripped CEF(https://cef-builds.spotifycdn.com/index.html) is small.
	ln -sf /opt/vivaldi/libffmpeg.so* libffmpeg.so
	for f in *;do if [ -e "${_cefdir}/$f" ];then ln -sf "$_cefdir/$f" $f;fi;done
}
package() {
    cp -dpr --no-preserve=ownership opt usr "$pkgdir"
}
