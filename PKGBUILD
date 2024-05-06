# Maintainer: Charlotte Ausel <ettolrach@disroot.org>
# Maintainer: Echo J. <aidas957 at gmail dot com>

_pkgname=vgmtrans
pkgname=${_pkgname}-git
pkgver=r1283.4b3cab2
pkgrel=1
pkgdesc="Converter for sequenced videogame music"
arch=("x86_64")
url="https://github.com/vgmtrans/vgmtrans"
license=("BSD-3-Clause" "Zlib")
depends=("hicolor-icon-theme" "minizip" "qt6-base" "qt6-svg")
makedepends=("cmake" "git" "qt6-tools")
source=("${_pkgname}::git+${url}"
        "git+https://github.com/gabime/spdlog.git")
sha256sums=("SKIP"
            "SKIP")

prepare() {
	cd "${srcdir}/${_pkgname}"

	# Setup spdlog submodule
	git submodule init
	git config submodule.lib/spdlog.url "${srcdir}/spdlog"
	git -c protocol.file.allow=always submodule update lib/spdlog

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
	install -Dm644 "../LICENSE/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "../LICENSE/LICENSE_oki_adpcm_state" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_oki_adpcm_state"
}
