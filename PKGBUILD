pkgname=amphi-cloud
pkgver=1.1.0
pkgrel=1
pkgdesc='A self-hosted cloud for secure file storage'
url=https://amphi.site
arch=('x86_64' 'aarch64')
license=(GPL-3.0-or-later)
depends=(fuse2 mpv zenity mimalloc ffmpeg imagemagick pdfium-binaries-bin)
options=(!debug)
source_x86_64=("https://github.com/amphi2024/cloud/releases/download/v${pkgver}/Cloud-${pkgver}-Linux-x86_64.deb")
source_aarch64=("https://github.com/amphi2024/cloud/releases/download/v${pkgver}/Cloud-${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=("4d3cc672c004d5b5003c24e6429d3450bcef9353a78e46522e459f62e311d36f")
sha256sums_aarch64=("4842f6aa9f85e3c0f217720c8f001d6cdd26c8334719b2a85565f5d7db6adfbc")
_pkgdesktop="amphi-cloud.desktop"


prepare() {
        if [[ -f data.tar.xz ]]; then
        tar -xf data.tar.xz
        elif [[ -f data.tar.zst ]]; then
        tar --zstd -xf data.tar.zst
        else
        echo "Error: data.tar.xz or data.tar.zst not found!"
        exit 1
        fi
}

build() {
    sed -i -E \
		"s|Exec=cloud|Exec=amphi-cloud|" \
		"${srcdir}/usr/share/applications/cloud.desktop"

	# Adjust .desktop to have it point to the correct icon
	sed -i -E 's/^Icon=.+/Icon=amphi-cloud/' "${srcdir}/usr/share/applications/cloud.desktop"
}
        
package() {
	# Desktop
	install -Dm644 "${srcdir}/usr/share/applications/cloud.desktop" "${pkgdir}/usr/share/applications/amphi-cloud.desktop"


	# Icons
	install -dm644 "${pkgdir}/usr/share/icons/"
	cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"

    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/cloud.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/amphi-cloud.png"
    done

	# Executable
	install -dm755 "${pkgdir}/opt/${pkgname}/"
	cp -a "${srcdir}/usr/share/cloud/." "${pkgdir}/opt/${pkgname}"
	mv "${pkgdir}/opt/${pkgname}/cloud" "${pkgdir}/opt/${pkgname}/amphi-cloud"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/amphi-cloud/amphi-cloud" \
		"${pkgdir}/usr/bin/amphi-cloud"
}