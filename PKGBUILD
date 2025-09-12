pkgname=amphi-music
pkgver=1.0.0
pkgrel=2
pkgdesc='Cross-platform music player with support for syncing libraries via a self-hosted server'
url=https://amphi.site
arch=('x86_64' 'aarch64')
license=(APACHE)
depends=(fuse2 mpv mimalloc zenity)
options=(!debug)
source_x86_64=("https://github.com/amphi2024/music/releases/download/v${pkgver}/music-linux-x64-${pkgver}.deb")
source_aarch64=("https://github.com/amphi2024/music/releases/download/v${pkgver}/music-linux-arm64-${pkgver}.deb")
sha256sums_x86_64=("59c96eacf38de396a1451ccc0b1232cd2b91ed5496526a7b55dc43546f0fdb70")
sha256sums_aarch64=("54451f25f2e79efa3bbf2231a755f6ae8fc80bc60f3e3a4c78027c4f9810cb2e")
_pkgdesktop="amphi-music.desktop"


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
		"s|Exec=music|Exec=amphi-music|" \
		"${srcdir}/usr/share/applications/music.desktop"

	# Adjust .desktop to have it point to the correct icon
	sed -i -E 's/^Icon=.+/Icon=amphi-music/' "${srcdir}/usr/share/applications/music.desktop"
}
        
package() {
	# Desktop
	install -Dm644 "${srcdir}/usr/share/applications/music.desktop" "${pkgdir}/usr/share/applications/amphi-music.desktop"


	# Icons
	install -dm644 "${pkgdir}/usr/share/icons/"
	cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"

    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/music.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/amphi-music.png"
    done

	# Executable
	install -dm755 "${pkgdir}/opt/${pkgname}/"
	cp -a "${srcdir}/usr/share/music/." "${pkgdir}/opt/${pkgname}"
	mv "${pkgdir}/opt/${pkgname}/music" "${pkgdir}/opt/${pkgname}/amphi-music"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/amphi-music/amphi-music" \
		"${pkgdir}/usr/bin/amphi-music"
}