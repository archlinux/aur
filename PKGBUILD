# Maintainer: Charlotte Ausel <ettolrach@disroot.org>
# Maintainer: Echo J. <aidas957 at gmail dot com>

_pkgname=vgmtrans
pkgname=${_pkgname}-git
pkgver=r1545.37545b4
pkgrel=1
pkgdesc="Converter for sequenced videogame music"
arch=("x86_64")
url="https://github.com/vgmtrans/vgmtrans"
license=("BSD-3-Clause" "Zlib")
depends=("hicolor-icon-theme" "qt6-base" "qt6-svg")
makedepends=("cmake" "git" "qt6-tools")
source=("${_pkgname}::git+${url}"
        "git+https://github.com/fmtlib/fmt.git"
        "git+https://github.com/rtissera/libchdr.git"
        "git+https://github.com/gabime/spdlog.git"
        "git+https://github.com/madler/zlib.git")
sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP")

prepare() {
	cd "${srcdir}/${_pkgname}"

	# Setup the submodules
	git submodule init
	for module in fmt libchdr spdlog zlib; do
		git config submodule.lib/"${module}".url "${srcdir}/${module}"
		git -c protocol.file.allow=always submodule update lib/"${module}"
	done

	# HACK: Deactivate the Qt deploy/RPATH parts (because it conflicts with the system packaging)
	sed -i 's/NOT FLATPAK/FALSE/' src/ui/qt/CMakeLists.txt
	sed -i -e '/INSTALL_RPATH_USE_LINK_PATH/d' -e 's/INSTALL_RPATH/FROG/g' src/ui/qt/CMakeLists.txt

	mkdir build || true
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}/build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_RPATH="/usr/lib/${_pkgname}" ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	make DESTDIR="${pkgdir}" install

	# Install missing CLI/shell binaries (and move the BASS libraries/licenses to the right place)
	install -Dm755 "src/ui/cli/vgmtrans-cli" "${pkgdir}/usr/bin/vgmtrans-cli"
	install -Dm755 "src/ui/shell/vgmtrans-shell" "${pkgdir}/usr/bin/vgmtrans-shell"

	install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
	mv "${pkgdir}"/usr/lib/libbass*.so "${pkgdir}/usr/lib/${_pkgname}"
	mv "${pkgdir}"/usr/share/licenses/LICENSE* "${pkgdir}/usr/share/licenses/vgmtrans"
	mv "${pkgdir}/usr/share/licenses/vgmtrans" "${pkgdir}/usr/share/licenses/${pkgname}"
}
