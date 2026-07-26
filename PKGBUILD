# Maintainer: Elias Ghafari <eliasghafari@disroot.org>
pkgname="quantframe"
pkgver=1.6.26
pkgrel=1
pkgdesc="Algorithmic trading program for Warframe"
arch=("x86_64")
url="https://github.com/Kenya-DK/quantframe-react"
license=("custom:MIT-modified")
depends=(
	'webkit2gtk-4.1'
	'appmenu-gtk-module'
	'libappindicator-gtk3'
)
conflicts=('quantframe-git')
makedepends=('git' 'nodejs' 'pnpm' 'rust' 'cargo' 'jq')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b5789152f5c6a7b69e643d3bfad1841e013075d157432c35e290b6b8bd3f5e5772b546450bd4f960cd89561efb62c0f89481447ad4f2c815b03849a85c44303e')

prepare() {
	cd "quantframe-react-${pkgver}"

	# Remove pubkey for updater
	jq '.plugins.updater.pubkey = ""' src-tauri/tauri.conf.json > tmp.json
	mv tmp.json src-tauri/tauri.conf.json

	# Deactivate bundler (.deb, .AppImage)
	jq '.bundle.active = false' src-tauri/tauri.conf.json > tmp.json
	mv tmp.json src-tauri/tauri.conf.json

	# Fetch dependencies
	pnpm install
}

build() {
	cd "quantframe-react-${pkgver}"

	pnpm tauri build
}

package() {
	cd "quantframe-react-${pkgver}"
	outputDir="./src-tauri/target/release"
	iconsDir="src-tauri/icons"

	# Binary
	install -Dm755 "${outputDir}/Quantframe" "${pkgdir}/usr/bin/${pkgname}"

	# Resources in Capital Q dir
	mkdir -p "${pkgdir}/usr/lib/Quantframe/"
	cp -r "${outputDir}/resources" "${pkgdir}/usr/lib/Quantframe/"

	# Icons
	install -Dm644 "${iconsDir}/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
	install -Dm644 "${iconsDir}/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
	install -Dm644 "${iconsDir}/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"

	# Desktop file
	mkdir -p "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Quantframe
Comment=Algorithmic trading program for Warframe
Exec=quantframe
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Game;
EOF

	# License
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
