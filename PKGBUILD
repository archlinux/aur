# Maintainer: K. Morton <pryre.dev@outlook.com>
# Contributor: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=qgroundcontrol-git
pkgver=r16572.c24029938
pkgrel=1
pkgdesc="Micro air vehicle ground control station."
arch=('x86_64')
url="https://github.com/mavlink/qgroundcontrol"
license=('GPL3')

depends=('bzip2'
		 'dbus'
		 'flac'
		 'gst-plugins-base-libs'
		 'libasyncns'
		 'libffi'
		 'libgcrypt'
		 'libgpg-error'
		 'libogg'
		 'libsndfile'
		 'libsystemd'
		 'libunwind'
		 'libx11'
		 'libxau'
		 'libxcb'
		 'libxdmcp'
		 'libxext'
		 'lz4'
		 'orc'
		 'pcre'
		 'sdl2'
		 'xz'
		 'icu'
		 'zlib'
		 'qt5-speech'
		 'qt5-multimedia'
		 'qt5-serialport'
		 'qt5-charts'
		 'qt5-quickcontrols'
		 'qt5-quickcontrols2'
		 'qt5-location'
		 'qt5-svg'
		 'qt5-graphicaleffects'
		 'qt5-tools'
		 'qt5-wayland'
		 'qt5-x11extras'
)

makedepends=('git' 'qt5-base')

source=('qgroundcontrol::git+https://github.com/mavlink/qgroundcontrol.git')

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive
	mkdir -p "$srcdir/${pkgname%-git}/build"
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	qmake ../qgroundcontrol.pro
	make

	echo "[Desktop Entry]
Type=Application
Name=QGroundControl Development
Comment=Ground control for unmanned vehicles
Path=/opt/${pkgname}/
Exec=/usr/bin/${pkgname}
Icon=/opt/${pkgname}/qgroundcontrol.png
Terminal=false
Categories=Qt;Utility;" > "$srcdir/${pkgname}.desktop"
}

package() {
	mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
	cp -R "$srcdir/${pkgname%-git}/build/release" "${pkgdir}/opt/${pkgname}"
	cp "$srcdir/${pkgname%-git}/resources/icons/qgroundcontrol.png" "${pkgdir}/opt/${pkgname}"
	cp "$srcdir/${pkgname%-git}/deploy/qgroundcontrol-start.sh" "${pkgdir}/opt/${pkgname}"
	cp "$srcdir/${pkgname}.desktop" "${pkgdir}/opt/${pkgname}"

	ln -s "/opt/${pkgname}/qgroundcontrol-start.sh" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}

# vim:set ts=2 sw=2 et:
