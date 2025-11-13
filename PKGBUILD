pkgname=amphi-notes
pkgver=2.0.0
pkgrel=1
pkgdesc='Cross-platform note-taking app that enables users to sync their data with a self-hosted server'
url=https://amphi.site
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
depends=(fuse2 mpv mimalloc)
options=(!debug)
source_x86_64=("https://github.com/amphi2024/notes/releases/download/v${pkgver}/Notes-${pkgver}-Linux-x86_64.deb")
source_aarch64=("https://github.com/amphi2024/notes/releases/download/v${pkgver}/Notes-${pkgver}-Linux-arm64.deb")
sha256sums_x86_64=("a67e0ec62158ff6ada5aab408ee1b0f87ace55f4fa33ea5713d5b33e7ad35bb7")
sha256sums_aarch64=("bfc308986512c90327020891a5384ecdb215124be06f755a2e275f41a85be2af")
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