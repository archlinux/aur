pkgname=amphi-music
pkgver=1.0.0
pkgrel=1
pkgdesc='Cross-platform music player with support for syncing libraries via a self-hosted server'
url=https://amphi.site
arch=('x86_64' 'aarch64')
license=(APACHE)
depends=(fuse2 mpv mimalloc zenity)
options=(!debug)
source_x86_64=("${url}/releases/music/music-linux-x64-1.0.0.deb")
source_aarch64=("${url}/releases/music/music-linux-arm64-1.0.0.deb")
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
        
package() {
	# Desktop
	install -Dm644 "${srcdir}/usr/share/applications/music.desktop" "${pkgdir}/usr/share/applications/amphi-music.desktop"


	# Icons
	install -dm644 "${pkgdir}/usr/share/icons/"
	cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"

	# Executable
	install -dm755 "${pkgdir}/opt/${pkgname}/"
	cp -a "${srcdir}/usr/share/music/." "${pkgdir}/opt/${pkgname}"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/amphi-music/music" \
		"${pkgdir}/usr/bin/music"
}
