# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="xournalpp"
pkgname="${_pkgname}-git"

pkgver=1.0.0.328.gbb3c205
pkgrel=1
pkgdesc="C++ re-write of tablet notetaking app Xournal - GIT development branch"
arch=('i686' 'x86_64')
url="https://github.com/xournalpp/xournalpp"
license=('GPL3')
makedepends=('git' 'cmake' 'gettext' 'boost')
depends=('gtk2' 'boost-libs' 'glib2' 'libglade' 'poppler-glib' 'glibmm' 'texlive-bin' 'desktop-file-utils')
provides=("xournal=${pkgver}" "xournal-dmgerman=${pkgver} xournalpp=${pkgver}")
conflicts=('xournal' 'xournalpp' 'xournal-dmgerman' 'xournal-image-patched' 'xournalpp-svn')
install="xournalpp.install"
source=("${_pkgname}::git+https://github.com/xournalpp/xournalpp.git#branch=development")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	git describe --tags | sed -e 's|v||g' -e 's|glib.||g' -e 's|-|.|g'
}

prepare() {
	cd "${srcdir}/${_pkgname}/"

	rm -rf "${srcdir}/${_pkgname}/build" || true
	mkdir -p "${srcdir}/${_pkgname}/build"
	cd "${srcdir}/${_pkgname}/build"

	cmake -DENABLE_OS="OFF" -DENABLE_MATHTEX="ON" -DCMAKE_INSTALL_PREFIX="/usr/" ..
}

build() {
	cd "${srcdir}/${_pkgname}/build"
	make
	echo
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	# sed 's|/usr/local|/usr|g' -i "${srcdir}/${_pkgname}/build/cmake_install.cmake" || true
	make DESTDIR="${pkgdir}/" install
	echo

	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes"

	install -D -m0644 "${srcdir}/${_pkgname}/ui/pixmaps/xournalpp.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/xournalpp.svg"
	install -D -m0644 "${srcdir}/${_pkgname}/ui/pixmaps/xoj.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/xoj.svg"
	ln -s "/usr/share/icons/hicolor/scalable/mimetypes/xoj.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/gnome-mime-application-x-xoj.svg"

	mkdir -p "${pkgdir}/usr/share/mime/packages"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/mimelnk/application"

	install -D -m0644 "${srcdir}/${_pkgname}/desktop/xournal.xml" "${pkgdir}/usr/share/mime/packages"
	install -D -m0644 "${srcdir}/${_pkgname}/desktop/xournalpp.desktop" "${pkgdir}/usr/share/applications"
	install -D -m0644 "${srcdir}/${_pkgname}/desktop/x-xoj.desktop" "${pkgdir}/usr/share/mimelnk/application"
}
