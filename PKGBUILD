# Maintainer: Marco Pompili <marcs.pompili at gmail dot com>
# Contributor: Marco Pompili <marcs.pompili at gmail dot com>

pkgname=openframeworks
pkgver=0.9.0
pkgrel=1
pkgdesc="openFrameworks is an open source C++ toolkit for creative coding."
url="http://openframeworks.cc/"
arch=('x86_64' 'i686')
license='MIT'
depends=('make' 'pkg-config' 'gcc' 'openal' 'python-lxml' 'glew' 'freeglut'
'freeimage' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad'
'gst-plugins-ugly' 'gst-libav' 'opencv' 'libxcursor' 'assimp' 'boost' 'mpg123' 'rtaudio')
optdepends=('qtcreator' 'xterm')
makedepends=()
options=(!strip)
install=openframeworks.install

[[ "$CARCH" == "i686" ]] && _arch="linux" || _arch="linux64"
_name=of_v${pkgver}_${_arch}_release

source=("http://www.openframeworks.cc/versions/v${pkgver}/${_name}.tar.gz" "of-make-workspace")

[[ "$CARCH" == "i686" ]] && md5sums=("4573107c7324e061043462e6efe5f85c") || md5sums=("96b1076fdcac679ff1888542851c175c")

md5sums+=("594d0a3c82e0451f7b7fb353e3b658c6")

build() {
	cd ${srcdir}/$_name/scripts/linux/

	msg2 "Building openFrameworks..."
	./compileOF.sh > /dev/null

	msg2 "Building the OF Project Generator..."
	./compilePG.sh > /dev/null
}

package() {
	install -d -m755 "${pkgdir}/opt"

	cp -R "${srcdir}/${_name}" "${pkgdir}/opt/openFrameworks"

	install -D -m775 "${srcdir}/of-make-workspace" "${pkgdir}/usr/bin/of-make-workspace"

	msg2 "Fixing emptyExample project files permissions..."

	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/addons.make
	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/config.make
	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/emptyExample.qbs
	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/Makefile

	install -D -m644 "${srcdir}/${_name}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
