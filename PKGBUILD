# Maintainer: Xavier Pedraza <xpedraza542@gmail.com>
_stable=892
_build=971
_base=chromapper
pkgname="${_base}-dev-bin"
pkgver=0.14.971
pkgrel=1
pkgdesc='Unity-based map editor for Beat Saber (binary, dev)'
arch=(x86_64)
url='https://github.com/Caeden117/ChroMapper/'
license=('GPL-2.0-only')
provides=("${_base}=${pkgver}")
conflicts=("${_base}" "${_base}-dev" "${_base}-bin")
options=(!strip)
depends=(glibc libgcc)
makedepends=(python3 xdelta3)
noextract=("${_stable}.patch")
source=(
    "https://cm.topc.at/nix/${_stable}/Linux.tar.gz"
    "https://cm.topc.at/nix/${_build}/${_stable}.patch"
    "https://cm.topc.at/cm.svg"
    "apply-patch.py"
)
sha256sums=(
    "f4c4f2199a8b4fed4c5cd296105232b5f8ef013ab51a0f402421613352e5ae5c" 
    "d08ba65a19a2c5dd30478b6e7a1d8bf7c16610d931accb7d3564221eac04455e"
    "533bdae8c7e95a94a4941a01de5f0ee94684ac2119d7297e4f5abe950ec64e80"
    "SKIP"
)

build() {
	# Create desktop entry
	cd "${srcdir}"
	echo "[Desktop Entry]" >> "${pkgname}.desktop"
	echo "Type=Application" >> "${pkgname}.desktop"
	echo "Version=${pkgver}" >> "${pkgname}.desktop"
	echo "Exec=/usr/bin/${pkgname}" >> "${pkgname}.desktop"
	echo "Name=ChroMapper" >> "${pkgname}.desktop"
	echo "Comment=${pkgdesc}" >> "${pkgname}.desktop"
	echo "Icon=${_base}" >> "${pkgname}.desktop"
	echo "Terminal=false" >> "${pkgname}.desktop"
	echo "Categories=Utility;Game;" >> "${pkgname}.desktop"

	# Apply patches
	echo "Applying patches..."
	python3 apply-patch.py
}

package() {
	install -dm755 "${pkgdir}/opt/${_base}"
	cd "${srcdir}/chromapper"
	cp -rt "${pkgdir}/opt/${_base}" *
    chmod +x "${pkgdir}/opt/${_base}/ChroMapper"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/cm.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_base}.svg"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_base}/ChroMapper" "${pkgdir}/usr/bin/${pkgname}"	
}

