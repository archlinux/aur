# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor : Mark Coolen <mark ddoott coolen aatt gmail ddoott ccoomm nniiccee!>

_pkgname="xournalpp"
pkgname="${_pkgname}-git"

pkgver=1.0.0.375.g7d9a7bd
pkgrel=1
pkgdesc="C++ re-write of tablet notetaking app Xournal"
arch=('i686' 'x86_64')
url="https://github.com/xournalpp/xournalpp"
license=('GPL-2.0')
makedepends=('git' 'cmake' 'gettext' 'boost')
depends=('texlive-core' 'gtk2' 'boost-libs' 'glib2' 'libglade' 'poppler-glib' 'glibmm' 'desktop-file-utils')
conflicts=('xournalpp')
install="xournalpp.install"
source=("${_pkgname}::git+https://github.com/xournalpp/xournalpp.git"
        "https://github.com/xournalpp/xournalpp/commit/4be5b5a1eab4c1ac873db237bc13c1be783081a7.patch"
        "https://github.com/swiftgeek/xournalpp/commit/12a409c8afc3c3ea8c8afebb67377c29e3d90035.patch")
sha256sums=('SKIP'
            '9d84d91c9d38eefc82a99fcd726b9b6e1225949fb5fdf4a07c7335da0f448d14'
            '3739e3a5538e53becf8864cdaeaa320ecc520a8a530d498491afc8ddff5accc1')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	git describe --tags | sed -e 's|v||g' -e 's|glib.||g' -e 's|-|.|g'
}

prepare() {
	cd "${srcdir}/${_pkgname}/"
  patch -p1 < ${srcdir}/4be5b5a1eab4c1ac873db237bc13c1be783081a7.patch
  patch -p1 < ${srcdir}/12a409c8afc3c3ea8c8afebb67377c29e3d90035.patch

	test -e "${srcdir}/${_pkgname}/build" || mkdir -p "${srcdir}/${_pkgname}/build"
	cd "${srcdir}/${_pkgname}/build"

	cmake -DENABLE_OS="OFF" -DENABLE_MATHTEX="ON" -DCMAKE_INSTALL_PREFIX="/usr/" ..
}

build() {
	cd "${srcdir}/${_pkgname}/build"
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	# sed 's|/usr/local|/usr|g' -i "${srcdir}/${_pkgname}/build/cmake_install.cmake" || true
	make DESTDIR="${pkgdir}/" install

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