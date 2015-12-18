# Maintainer: Marco Pompili <marcs.pompili at gmail dot com>
# Contributor: Marco Pompili <marcs.pompili at gmail dot com>

pkgname=openframeworks
pkgver=0.9.0
pkgrel=2
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
_name="of_v${pkgver}_${_arch}_release"

source=("http://www.openframeworks.cc/versions/v${pkgver}/${_name}.tar.gz" "of-make-workspace")

[[ "$CARCH" == "i686" ]] && md5sums=("4573107c7324e061043462e6efe5f85c") || md5sums=("96b1076fdcac679ff1888542851c175c")

md5sums+=("594d0a3c82e0451f7b7fb353e3b658c6")

prepare() {
	export OF_ROOT=${srcdir}/${_name}
	export LC_ALL=C

	ARCH=$(uname -m)

	if [ "$ARCH" = "x86_64" ]; then
		LIBSPATH=linux64
	else
		LIBSPATH=linux
	fi

	sys_cores=$(getconf _NPROCESSORS_ONLN)
	if [ $sys_cores -gt 1 ]; then
		cores=$(($sys_cores-1))
	else
		cores=1
	fi

	msg2 "Found $sys_cores core/s, set sail!"

	GCC_MAJOR_GT_4=$(expr `gcc -dumpversion | cut -f1 -d.` \> 4)
	if [ $GCC_MAJOR_GT_4 -eq 1 ]; then

		msg2 "Rebuilding POCO libraries for gcc5, this could take a while..."

    cd ${OF_ROOT}/scripts/apothecary
    ./apothecary -j${cores} update poco

	fi
}

build() {
	cd ${srcdir}/${_name}

	cd libs/openFrameworksCompiled/project

	msg2 "Building openFrameworks Debug version"
	make -j$cores Debug

	msg2 "Building openFrameworks Release version"
	make -j$cores Release

	cd ${srcdir}/${_name}

	msg2 "Building OF Project Generator tool..."
	cd apps/projectGenerator/commandLine
	make -j$cores Release

	cd ${srcdir}/${_name}

	msg2 "Building OF Project Generator interface..."
	cd libs/openFrameworksCompiled/project
	make -j$cores Release
}

package() {
	install -Dm755 "${srcdir}/${_name}/apps/projectGenerator/commandLine/bin/projectGenerator" \
	"${pkgdir}/usr/bin/projectGenerator"

	install -dm755 "${pkgdir}/opt"

	cp -R "${srcdir}/${_name}" "${pkgdir}/opt/openFrameworks"

	install -Dm775 "${srcdir}/of-make-workspace" "${pkgdir}/usr/bin/of-make-workspace"

	msg2 "Fixing emptyExample project files permissions..."

	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/addons.make
	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/config.make
	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/emptyExample.qbs
	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/Makefile

	install -D -m644 "${srcdir}/${_name}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
