# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qtwebkit
pkgver=2.3.4
pkgrel=10
arch=('i686' 'x86_64')
url='http://trac.webkit.org/wiki/QtWebKit'
pkgdesc='An open source web browser engine (Qt port)'
license=('LGPL-2.1-or-later' 'GPL-3.0-or-later')
depends=('fontconfig' 'gcc-libs' 'glib2' 'glibc' 'gst-plugins-base-libs' 'gstreamer'
         'libglvnd' 'libjpeg-turbo' 'libpng' 'libx11' 'libxrender' 'qt4' 'sqlite'
         'systemd-libs' 'zlib')
makedepends=('git' 'gperf' 'python' 'ruby')
conflicts=('qt<4.8')
_qtver=4.8.7
source=("https://sources.archlinux.org/other/packages/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "https://download.qt.io/archive/qt/4.8/${_qtver}/qt-everywhere-opensource-src-${_qtver}.tar.gz"
        "git+https://src.fedoraproject.org/rpms/qtwebkit.git#commit=fb37b4c762fe55ed2236e9b815e16587caa6043d"
        'fix-build-in-usr.patch' 'fix-g_free.patch' 'qwebview.patch')
sha1sums=('31bc60de1cf26bb0766d539b4d564651ddbb0650'
          '76aef40335c0701e5be7bb3a9101df5d22fe3666'
          '9460a62908dc2f81d3490ccdac19ca5ea13bc285'
          '412a58db507fa14268c9f30627d62fd448f9dccb'
          'fcfa5e79f6d405c70c7227864623ec20f5fc05f2'
          'c3df6107233f466a032e36681cee07f16536657c')

prepare() {
	cd "${pkgname}"-"${pkgver}"
	patch -p1 -i "${srcdir}"/fix-build-in-usr.patch
	patch -p1 -i "${srcdir}"/fix-g_free.patch

	# Use Fedora patches for fixes, Python 3 compatibility, etc.
	for p in "${srcdir}"/qtwebkit/*.patch; do
		patch -p1 -i "${p}"
	done

	cd ../qt-everywhere-opensource-src-"${_qtver}"
	patch -p1 -i "${srcdir}"/qwebview.patch
}

build() {
	cd "${pkgname}"-"${pkgver}"

	OPTS=( "--no-webkit2" "--no-xslt" )
	if [ "${CARCH}" = "i686" ]; then
		# FS#33418
		OPTS+=( "--no-force-sse2" )
	fi

	export QTDIR=/usr
	export PATH="/usr/lib/qt4/bin:$PATH"
	Tools/Scripts/build-webkit --qt \
		--makeargs="${MAKEFLAGS}" \
		--prefix=/usr \
		"${OPTS[@]}"

	# Build the QWebView plugin (FS#27914)
	cd ../qt-everywhere-opensource-src-"${_qtver}"/tools/designer/src/plugins/qwebview
	qmake-qt4
	make
}

package() {
	cd "${pkgname}"-"${pkgver}"
	make INSTALL_ROOT="${pkgdir}" -C WebKitBuild/Release install

	cd ../qt-everywhere-opensource-src-"${_qtver}"/tools/designer/src/plugins/qwebview
	make INSTALL_ROOT="${pkgdir}" install

	# Fix wrong libs path in pkgconfig file
	perl -pi -e "s, -L${srcdir}/?\S+,,g" "${pkgdir}"/usr/lib/pkgconfig/QtWebKit.pc

	# Fix wrong path in prl file
	sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' "${pkgdir}"/usr/lib/libQtWebKit.prl
}
