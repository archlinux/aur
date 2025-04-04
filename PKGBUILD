pkgname=amphi-notes
pkgver=1.1.0
pkgrel=1
pkgdesc='A note-taking app created by Amphi'
url=https://amphi.site
arch=('x86_64' 'aarch64')
license=(APACHE)
depends=(fuse2 mpv mimalloc)
options=(!debug)
source_x86_64=("${url}/releases/notes/notes-linux-x64-1.1.0.deb")
source_aarch64=("${url}/releases/notes/notes-linux-arm64-1.1.0.deb")
sha256sums_x86_64=("d509a37a7d23e0ad31a93b0330a0918f6fb800f03a1c35f382c736915e474ed3")
sha256sums_aarch64=("8d028fde9cfaabf7b7418c63439aa9652ab913898a531036635490c81cb20e1b")
_pkgdesktop="amphi-notes.desktop"


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
	install -Dm644 "${srcdir}/usr/share/applications/notes.desktop" "${pkgdir}/usr/share/applications/amphi-notes.desktop"


	# Icons
	install -dm644 "${pkgdir}/usr/share/icons/"
	cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"

	# Executable
	install -dm755 "${pkgdir}/opt/${pkgname}/"
	cp -a "${srcdir}/usr/share/notes/." "${pkgdir}/opt/${pkgname}"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/amphi-notes/notes" \
		"${pkgdir}/usr/bin/notes"
}