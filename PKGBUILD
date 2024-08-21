# Maintainer: Nixuge
# Contributor: Noah Vogt <noah@noahvogt.com>
# Contributor: SpieringsAE (aarch64 addition)

# Note: 
# using the .deb instead of the .tar.gz as it already contains the icons as well as the .desktop file.

pkgname=localsend-bin
pkgver=1.15.4
pkgrel=1
pkgdesc='An open source cross-platform alternative to AirDrop'
url=https://github.com/localsend/localsend
arch=('x86_64' 'aarch64')
license=(MIT)
depends=(fuse2 xdg-user-dirs libayatana-appindicator)
conflicts=('localsend')
provides=('localsend')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/LocalSend-${pkgver}-linux-x86-64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/LocalSend-${pkgver}-linux-arm-64.deb")
sha256sums_x86_64=('a6d1025bab78095ec2f3d16e468bd74624544636c6ac3083d987d43d336c878c')
sha256sums_aarch64=('7b66a64f2a94d03734b7e1e3c1d7d935d975feb69500a2ef8bc33e9b5e6a338d')
_pkgdesktop="localsend_app.desktop"


prepare() {
	tar -xf data.tar.xz
}

build() {
	sed -i -E \
		"s|Exec=localsend_app|Exec=localsend|" \
		"${srcdir}/usr/share/applications/${_pkgdesktop}"

	# Adjust .desktop to have it point to the correct icon
	sed -i -E 's/^Icon=.+/Icon=localsend/' "${srcdir}/usr/share/applications/${_pkgdesktop}"
}

package() {
	# Desktop
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgdesktop}" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop" 
	

	# Icons
	install -dm644 "${pkgdir}/usr/share/icons/"
	cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
	# Dirty - rename icons to localsend
	for res in "128x128" "256x256"; do
		mv "${pkgdir}/usr/share/icons/hicolor/${res}/apps/localsend_app.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/localsend.png"
	done


	# Executable
	install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
	cp -a "${srcdir}/usr/share/localsend_app/." "${pkgdir}/opt/${pkgname%-*}"
	# Same as icons - rename to localsend
	mv "${pkgdir}/opt/${pkgname%-*}/localsend_app" "${pkgdir}/opt/${pkgname%-*}/localsend"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${pkgname%-*}/${pkgname%-*}" \
		"${pkgdir}/usr/bin/${pkgname%-*}"
}
