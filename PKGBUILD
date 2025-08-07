pkgname=amphi-notes
pkgver=1.1.1
pkgrel=1
pkgdesc='Cross-platform note-taking app that enables users to sync their data with a self-hosted server'
url=https://amphi.site
arch=('x86_64' 'aarch64')
license=(APACHE)
depends=(fuse2 mpv mimalloc)
options=(!debug)
source_x86_64=("${url}/releases/notes/notes-linux-x64-${pkgver}.deb")
source_aarch64=("${url}/releases/notes/notes-linux-arm64-${pkgver}.deb")
sha256sums_x86_64=("7e2cc3796875464ab20dc3ec494e280192871808c3830911db96f038056cb4a6")
sha256sums_aarch64=("435d6bb354ff806299ed5f2e0134dfb2bfc2619772951e378b04cf2764d60326")
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

build() {
    sed -i -E \
		"s|Exec=notes|Exec=amphi-notes|" \
		"${srcdir}/usr/share/applications/notes.desktop"

	# Adjust .desktop to have it point to the correct icon
	sed -i -E 's/^Icon=.+/Icon=amphi-notes/' "${srcdir}/usr/share/applications/notes.desktop"
}
        
package() {
	# Desktop
	install -Dm644 "${srcdir}/usr/share/applications/notes.desktop" "${pkgdir}/usr/share/applications/amphi-notes.desktop"


	# Icons
	install -dm644 "${pkgdir}/usr/share/icons/"
	cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"

    for res in "128x128" "256x256"; do
        mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/notes.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/amphi-notes.png"
    done

	# Executable
	install -dm755 "${pkgdir}/opt/${pkgname}/"
	cp -a "${srcdir}/usr/share/notes/." "${pkgdir}/opt/${pkgname}"
	mv "${pkgdir}/opt/${pkgname}/notes" "${pkgdir}/opt/${pkgname}/amphi-notes"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/amphi-notes/amphi-notes" \
		"${pkgdir}/usr/bin/amphi-notes"
}