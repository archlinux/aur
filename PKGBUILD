# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qtwebkit
pkgver=2.3.4
pkgrel=9
arch=('i686' 'x86_64')
url='http://trac.webkit.org/wiki/QtWebKit'
pkgdesc='An open source web browser engine (Qt port)'
license=('LGPL2.1' 'GPL3')
depends=('fontconfig' 'gcc-libs' 'glib2' 'glibc' 'gst-plugins-base-libs' 'gstreamer'
         'libglvnd' 'libjpeg-turbo' 'libpng' 'libx11' 'libxrender' 'qt4' 'sqlite'
         'systemd-libs' 'zlib')
makedepends=('gperf' 'python2' 'ruby')
conflicts=('qt<4.8')
_qtver=4.8.7
source=("https://sources.archlinux.org/other/packages/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "https://download.qt.io/archive/qt/4.8/${_qtver}/qt-everywhere-opensource-src-${_qtver}.tar.gz"
        "https://src.fedoraproject.org/rpms/qtwebkit/raw/rawhide/f/webkit-qtwebkit-23-gcc5.patch"
        "https://src.fedoraproject.org/rpms/qtwebkit/raw/rawhide/f/webkit-qtwebkit-23-glib2.patch"
        "https://src.fedoraproject.org/rpms/qtwebkit/raw/rawhide/f/qtwebkit-bison-3.7.patch"
        'use-python2.patch' 'qwebview.patch' 'fix-build-in-usr.patch')
sha1sums=('31bc60de1cf26bb0766d539b4d564651ddbb0650'
          '76aef40335c0701e5be7bb3a9101df5d22fe3666'
          '4b3f92a914674ef311b2a7c0ca329d01e1af76cf'
          '67a3f86a7981be01baa507bbd091be048cdf18af'
          '77b258bd267b070f21f4b7d5b480238c300020fb'
          '315b6ff603f35e5492a036f7082f6aa075dfb607'
          'c3df6107233f466a032e36681cee07f16536657c'
          '412a58db507fa14268c9f30627d62fd448f9dccb')

prepare() {
	cd "${pkgname}"-"${pkgver}"
	patch -p1 -i "${srcdir}"/use-python2.patch
	patch -p1 -i "${srcdir}"/fix-build-in-usr.patch

	# Fix build on Arch using additional patched (from Fedora)
	patch -p1 -i "${srcdir}"/webkit-qtwebkit-23-gcc5.patch
	patch -p1 -i "${srcdir}"/webkit-qtwebkit-23-glib2.patch
	patch -p1 -i "${srcdir}"/qtwebkit-bison-3.7.patch

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
