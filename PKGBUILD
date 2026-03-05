# Maintainer: Charlotte Ausel <ettolrach@disroot.org>
# Maintainer: Echo J. <aidas957 at gmail dot com>

_pkgname=vgmtrans
pkgname=${_pkgname}-git
pkgver=r1550.b684e65
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

	mkdir build || true
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}/build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
			-DCMAKE_INSTALL_LIBDIR="lib/${_pkgname}" \
			-DNO_QT_DEPLOY=ON \
			-DINSTALL_SHELL=ON \
			..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	make DESTDIR="${pkgdir}" install

	# Move the licenses to the right place
	mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
