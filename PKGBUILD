# Maintainer: Charlotte Ausel <ettolrach@disroot.org>
# Maintainer: Echo J. <aidas957 at gmail dot com>

_pkgname=vgmtrans
pkgname=${_pkgname}-git
pkgver=r1465.e9ff182
pkgrel=1
pkgdesc="Converter for sequenced videogame music"
arch=("x86_64")
url="https://github.com/vgmtrans/vgmtrans"
license=("BSD-3-Clause" "Zlib")
depends=("hicolor-icon-theme" "qt6-base" "qt6-svg")
makedepends=("cmake" "git" "qt6-tools")
source=("${_pkgname}::git+${url}"
        "git+https://github.com/rtissera/libchdr.git"
        "git+https://github.com/gabime/spdlog.git"
        "git+https://github.com/madler/zlib.git")
sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "SKIP")

prepare() {
	cd "${srcdir}/${_pkgname}"

	# Setup the submodules
	git submodule init
	for module in libchdr spdlog zlib; do
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

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_RPATH="/usr/lib/${_pkgname}" ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	make DESTDIR="${pkgdir}" install

	# Install missing CLI binary (and BASS stuff)
	install -Dm755 "bin/vgmtrans-cli" "${pkgdir}/usr/bin/vgmtrans-cli"
	install -Dm644 "../lib/bass/libbass.so" "${pkgdir}/usr/lib/${_pkgname}/libbass.so"
	install -Dm644 "../lib/bass/libbassmidi.so" "${pkgdir}/usr/lib/${_pkgname}/libbassmidi.so"

	# Install the licenses
	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "../licenses/LICENSE_oki_adpcm_state" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_oki_adpcm_state"
}
