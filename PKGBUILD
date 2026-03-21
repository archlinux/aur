pkgname=amphi-photos
pkgver=2.1.0
pkgrel=1
pkgdesc='Cross-platform photos app with self-hosted sync'
url=https://amphi.site
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=(fuse2 mpv zenity mimalloc ffmpeg imagemagick)
options=(!debug)
source_x86_64=("https://github.com/amphi2024/photos/releases/download/v${pkgver}/Photos-${pkgver}-Linux-x86_64.deb")
source_aarch64=("https://github.com/amphi2024/photos/releases/download/v${pkgver}/Photos-${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=("4cc4813ea22e99b447f205d0c89304e8701f1524e06f5739142a35fa8015d7d0")
sha256sums_aarch64=("ec3bbe91e036724e3ed4b6a51a5cb8fc742067f2756cf6eda0ea7ec2a2fceeea")
_pkgdesktop="amphi-photos.desktop"


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
		"s|Exec=photos|Exec=amphi-photos|" \
		"${srcdir}/usr/share/applications/photos.desktop"

	# Adjust .desktop to have it point to the correct icon
	sed -i -E 's/^Icon=.+/Icon=amphi-photos/' "${srcdir}/usr/share/applications/photos.desktop"
}
        
package() {
	# Desktop
	install -Dm644 "${srcdir}/usr/share/applications/photos.desktop" "${pkgdir}/usr/share/applications/amphi-photos.desktop"


	# Icons
	install -dm644 "${pkgdir}/usr/share/icons/"
	cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"

    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/photos.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/amphi-photos.png"
    done

	# Executable
	install -dm755 "${pkgdir}/opt/${pkgname}/"
	cp -a "${srcdir}/usr/share/photos/." "${pkgdir}/opt/${pkgname}"
	mv "${pkgdir}/opt/${pkgname}/photos" "${pkgdir}/opt/${pkgname}/amphi-photos"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/amphi-photos/amphi-photos" \
		"${pkgdir}/usr/bin/amphi-photos"
}