# Maintainer: Gustavo Vinícios de Souza <gnsfujiwara@disroot.org>

_pkgname=picard

pkgname="${_pkgname}"-appimage-daily
pkgver=continuous
pkgrel=1
pkgdesc="MusicBrainz Picard audio file tagger, unofficial binary builds for the latest development version."
arch=('x86_64')
url="https://github.com/phw/picard-daily"
license=('MIT')
depends=('zlib' 'fuse2')
conflicts=('picard' 'picard-git')
options=(!strip)
_appimage="MusicBrainz-Picard-daily-x86_64.AppImage"
source_x86_64=("${_appimage}::https://github.com/phw/picard-daily/releases/download/${pkgver}/${_appimage}"
	"https://raw.githubusercontent.com/phw/picard-daily/${pkgver}/LICENSE"
)
noextract=("${_appimage}")
sha256sums_x86_64=(SKIP SKIP)

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
		"squashfs-root/org.musicbrainz.Picard.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/org.musicbrainz.Picard.desktop" \
		"${pkgdir}/usr/share/applications/org.musicbrainz.Picard.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

	# Symlink license
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
