_base=tempora
_version_number=1.5.0
_version_classifier=beta
_version="${_version_number}-${_version_classifier}"
_icon_sizes=("16" "32" "64" "128" "256" "512")
pkgname="${_base}-bin"
pkgver="${_version_number}"
pkgrel=1
pkgdesc="An application designed to simplify and speed up the process of synchronizing a recorded piece of music to a digital metronome"
arch=("x86_64")
url="https://github.com/teamkongehund/Tempora"
license=("CC-BY-NC-ND-4.0")
provides=("${_base}=${_version_number}")
makedepends=("imagemagick")
options=(!strip)
source=(
	"https://github.com/teamkongehund/Tempora/releases/download/v${_version}/Tempora-v${_version}-Linux.zip"
	"https://raw.githubusercontent.com/teamkongehund/Tempora/refs/tags/v${_version}/Images/Tempora2.png"
)
sha256sums=(
	"19f41ad6312bbec78fcb54a40a5d3cdf958dfd444ed5d2ff7e8d0ff59634a1db"
	"195caf987721f51d2a4cbb2f33f7a749d7457e1087cc956d3d7c51253d0abed3"
)

build() {
	# Create desktop entry
	cd "${srcdir}"
	echo "[Desktop Entry]" >> "${pkgname}.desktop"
	echo "Type=Application" >> "${pkgname}.desktop"
	echo "Version=${_version_number}" >> "${pkgname}.desktop"
	echo "Exec=/usr/bin/${pkgname}" >> "${pkgname}.desktop"
	echo "Name=Tempora" >> "${pkgname}.desktop"
	echo "Comment=${pkgdesc}" >> "${pkgname}.desktop"
	echo "Icon=${_base}" >> "${pkgname}.desktop"
	echo "Terminal=false" >> "${pkgname}.desktop"
	echo "Categories=Utilty;" >> "${pkgname}.desktop"

	# Scale icon
	for size in "${_icon_sizes[@]}"; do
		sh -c "magick Tempora2.png -resize ${size}x${size} icon_${size}.png"	
	done
}

package() {
	# Populate /opt
	install -dm755 "${pkgdir}/opt/${_base}"
	cd "${srcdir}"
	cp -t "${pkgdir}/opt/${_base}" "Tempora-Linux"
	cp -t "${pkgdir}/opt/${_base}" "Tempora-Linux.sh"
	cp -rt "${pkgdir}/opt/${_base}" "data_Tempora_linuxbsd_x86_64"
	chmod +x "${pkgdir}/opt/${_base}/Tempora-Linux"
	chmod +x "${pkgdir}/opt/${_base}/Tempora-Linux.sh"
	
	# Populate /usr/share
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for size in "${_icon_sizes[@]}"; do
		install -Dm644 "${srcdir}/icon_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_base}.png"
	done
	
	# Populate /usr/bin
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_base}/Tempora-Linux.sh" "${pkgdir}/usr/bin/${pkgname}"
}
