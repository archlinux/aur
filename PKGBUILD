# Maintainer: BrainDamage

pkgname=artiphon-instrument-one-editor
pkgver=1.0.20
pkgrel=1
pkgdesc="is an interface for customizing the settings of your INSTRUMENT 1."
arch=('any')
url="https://artiphon.com/pages/downloads"
license=('custom:commercial')
depends=('electron4')
makedepends=('p7zip' 'icoutils' 'imagemagick')
source=("https://storage.googleapis.com/artiphon-preset-editor/Artiphon%20INSTRUMENT%201%20Editor%20Setup%20${pkgver}.exe")
sha256sums=('ae07e6be3803bc8339cd250c0681b2c11f5a8cc24fdafa8cc5beedbb85dd4ec8')

build() {
	cd "${srcdir}"

	7z -y e "Artiphon%20INSTRUMENT%201%20Editor%20Setup%20${pkgver}.exe"
	7z -y e "app-64.7z" -o"${pkgname}-data"

	cat - > "${pkgname}" <<- EOF
		#!/bin/env sh
		exec electron4 "/usr/share/${pkgname}/app.asar"
	EOF

	wrestool -x -t 3 -n 1 -R "${pkgname}-data/Artiphon INSTRUMENT 1 Editor.exe" > "${pkgname}.png"
	for size in 16 32 64 256; do
		convert "${pkgname}.png" -resize "${size}x${size}" "${pkgname}-${size}x${size}.png"
	done

	cat - > "${pkgname}.desktop" <<- EOF
		[Desktop Entry]
		Type=Application
		Name=Artiphon Instrument One Editor
		Comment=The Artiphon INSTRUMENT 1 Editor is an interface for customizing the settings of your INSTRUMENT 1.
		Exec="${pkgname}"
		Icon="${pkgname}"
		Categories=Music;Audio;Multimedia;
	EOF
}

package() {
	cd "${srcdir}"

	mkdir -pv "${pkgdir}/usr/bin"
	install -Dvm 755 "${pkgname}" -t "${pkgdir}/usr/bin"

	mkdir -pv "${pkgdir}/usr/share/${pkgname}"
	find "${pkgname}-data" -iname '*.asar' -exec install -Dvm 644 {} -t "${pkgdir}/usr/share/${pkgname}" \;

	mkdir -pv "${pkgdir}/usr/share/applications"
	install -Dvm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

	for size in 16 32 64 256; do
		mkdir -pv "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		install -Dvm 644 "${pkgname}-${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
	done
}
