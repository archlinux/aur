# Maintainer: Elias Ghafari <eliasghafari@disroot.org>
pkgname="quantframe"
pkgver=1.6.25
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
makedepends=('git' 'nodejs' 'pnpm' 'rust' 'cargo' 'jq')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ce672e6271dffeeda97a122956a24b8908c2bc5532e3165651f0e98c8ca6f9ea58d2d30a89c3a913b1e7e6944a48cff7b31ce266d856b39b01151f80fe80b244')

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
