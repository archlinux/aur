# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgbase=sonic-pyside
pkgname=(
	'sonic-pyside6'
	'sonic-pyside6-tools'
	'sonic-shiboken6'
	'sonic-shiboken6-generator'
)
pkgver=6.11.2.2
pkgrel=1
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-pyside'
license=(
	'GPL-3.0-only'
	'LGPL-3.0-only'
	'LicenseRef-Qt-Commercial'
	'Qt-GPL-exception-1.0'
)
makedepends=(
	'clang'
	'cmake'
	'llvm'
	'ninja'
	'python-numpy'
	'python-setuptools'
	'qt6-3d'
	'qt6-canvaspainter'
	'qt6-charts'
	'qt6-connectivity'
	'qt6-datavis3d'
	'qt6-graphs'
	'qt6-httpserver'
	'qt6-location'
	'qt6-multimedia'
	'qt6-networkauth'
	'qt6-positioning'
	'qt6-quick3d'
	'qt6-remoteobjects'
	'qt6-scxml'
	'qt6-sensors'
	'qt6-serialbus'
	'qt6-serialport'
	'qt6-shadertools'
	'qt6-speech'
	'qt6-svg'
	'qt6-tools'
	'qt6-webchannel'
	'qt6-webengine'
	'qt6-websockets'
	'qt6-webview'
)
groups=('sonicde')
source=("$pkgbase-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('db05b3a0b11b3c54958810ee3d1827bdc6935757b7e49e29a532c35ed3014255')

_install_egg_info() (
	export PATH="/usr/lib/qt6/bin:$PATH"
	local _platlib

	cd "$pkgbase-$pkgver"
	python setup.py egg_info --build-type="$1"
	_platlib=$(
		python -c 'import sysconfig; print(sysconfig.get_path("platlib"))'
	)
	cp -r "$2" "$pkgdir/$_platlib"
)

build() {
	cmake -B build -S "$pkgbase-$pkgver" -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DSHIBOKEN_PYTHON_LIBRARIES="$(pkgconf python3-embed --libs)" \
		-DBUILD_TESTS=OFF \
		-DFORCE_LIMITED_API=no \
		-DNO_QT_TOOLS=yes \
		-DDISABLE_PYI=ON \
		-DNUMPY_INCLUDE_DIR="$(numpy-config --cflags | sed -e 's|-I||')"

	PYTHONPATH="$PWD/build/sources" cmake --build build
}

package_sonic-shiboken6() {
	pkgdesc='Python/C++ bindings helper module'
	depends=(
		'glibc'
		'libgcc'
		'libstdc++'
		'python'
	)
	provides=("shiboken6")
	conflicts=('shiboken6')

	DESTDIR="$pkgdir" cmake --install build/sources/shiboken6
	_install_egg_info shiboken6 shiboken6.egg-info
}

package_sonic-shiboken6-generator() {
	pkgdesc='Python/C++ bindings generator'
	depends=(
		'clang'
		'glibc'
		'libgcc'
		'libstdc++'
		'libxml2'
		'libxslt'
		'llvm'
		'python'
		'qt6-base'
	)
	provides=("shiboken6-generator")
	conflicts=('shiboken6-generator')

	DESTDIR="$pkgdir" cmake --install build/sources/shiboken6_generator
	_install_egg_info shiboken6-generator shiboken6_generator.egg-info
}

package_sonic-pyside6() {
	pkgdesc='Enables the use of Qt6 APIs in Python applications'
	depends=(
		'glibc'
		'libgcc'
		'libstdc++'
		'python'
		'qt6-base'
		'qt6-declarative'
		'sonic-shiboken6'
	)
	optdepends=(
		'qt6-3d: Qt3D bindings'
		'qt6-canvaspainter: QtCanvasPainter bindings'
		'qt6-charts: QtCharts bindings'
		'qt6-connectivity: QtBluetooth and QtNfc bindings'
		'qt6-datavis3d: QtDataVisualization bindings'
		'qt6-graphs: QtGraphs bindings'
		'qt6-httpserver: QtHttpServer bindings'
		'qt6-location: QtLocation bindings'
		'qt6-multimedia: QtMultimedia bindings'
		'qt6-networkauth: QtNetworkAuth bindings'
		'qt6-positioning: QtPositioning bindings'
		'qt6-quick3d: QtQuick3D bindings'
		'qt6-remoteobjects: QtRemoteObjects bindings'
		'qt6-scxml: QtScxml bindings'
		'qt6-sensors: QtSensors bindings'
		'qt6-serialbus: QtSerialBus bindings'
		'qt6-serialport: QtSerialPort bindings'
		'qt6-speech: QtTextToSpeech bindings'
		'qt6-svg: QtSvg bindings'
		'qt6-tools: QtHelp, QtUiTools bindings'
		'qt6-webchannel: QtWebChannel bindings'
		'qt6-webengine: QtWebEngine bindings'
		'qt6-websockets: QtWebSockets bindings'
		'qt6-webview: QtWebView bindings'
	)
	provides=(
		"pyside6"
		'qt6-python-bindings'
	)
	conflicts=('pyside6')

	DESTDIR="$pkgdir" cmake --install build/sources/pyside6
	_install_egg_info pyside6 PySide6.egg-info
}

package_sonic-pyside6-tools() {
	local _pylib

	pkgdesc='Tools for pyside6'
	depends=(
		'python'
		'sonic-pyside6'
	)
	provides=("pyside6-tools")
	conflicts=('pyside6-tools')

	DESTDIR="$pkgdir" cmake --install build/sources/pyside-tools

	# Add convenience pyside6-designer wrapper
	# Entry points in /usr/bin are not installed in the cmake build. This is the only
	# one that does anything besides wrapping the Qt executable
	_pylib=$(
		python -c 'import sysconfig; print(sysconfig.get_config_var("LDLIBRARY"))'
	)
	printf 'export LD_PRELOAD=%s\nexec designer6 "$@"\n' "$_pylib" > pyside6-designer
	install -Dm755 pyside6-designer -t "$pkgdir/usr/bin"
}
