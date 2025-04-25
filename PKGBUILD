# Contributor: Mohamed Tarek <Mokhamed_tarek At mail Dot ru>
# Contributer: knedl1k <knedl1k At tuta Dot io>

_name=coppeliasim
pkgname=${_name}-bin
pkgver=4.9.0.rev6
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Robotic Simulation software from Coppelia Robotics"
arch=("x86_64")
url="http://www.coppeliarobotics.com/"
license=("GPL" "LGPL")
depends=(qt5-base ffmpeg4.4 openssl)
makedepends=(binutils patchelf)
optdepends=( #install everything
qt5-{3d,connectivity,declarative,graphicaleffects,imageformats,location,multimedia,remoteobjects,scxml,sensors,serialport,svg}
qt5-{quick3d,quickcontrols,quickcontrols2,webchannel,webengine,websockets,xmlpatterns}
'qt5-wayland: Wayland' libQt5Gamepad.so libdeclarative_gamepad.so libdeclarative_webview.so
)
conflicts=($_name)
options=(!strip)
provides=($_name)
_srctop=CoppeliaSim_Edu_V${_pkgver}_Ubuntu24_04
source=("${url}/files/V${_pkgver}/${_srctop}.tar.xz")
sha256sums=('52b82d45f971c30960c4de2e4a5ff2da86b0ab31fc6b0267e5df0e7eef826442')
#sha256sums=('SKIP')
#noextract=(*.tar.xz)
prepare() {
# tar --no-same-owner --no-same-permissions -xf *.tar.xz #fix permission?
	rm *.tar.xz #for build on RAM
}
package() {
	install -d "${pkgdir}"/{opt,usr/{bin,share/doc}}
	mv "${_srctop}" "${pkgdir}"/opt/$_name
	ln -s "/opt/${_name}/coppeliaSim.sh" "${pkgdir}/usr/bin/${_name}"
	cd "${pkgdir}"/opt/$_name
	mv manual "${pkgdir}"/usr/share/doc/$_name
	#Drop bundled libs
	rm -r libQt5* imageformats platform* xcbglintegrations sensors qml/Qt* \
		libssl.so* libcrypto.so* libicu*.so* libav*.so* libsw*.so*
	#Remove Qt5 symbol ver
	for b in coppeliaSim libcoppeliaSim.so libsim*.so
		do patchelf $b $(nm -D "$b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
	done
}
