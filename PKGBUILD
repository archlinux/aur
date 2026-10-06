# Maintainer: Elia Nitsche <nitscheelia at gmail dot com>
pkgname="quantframe-git"
_pkgname=${pkgname%-git}
pkgver=1.6.30.r0.g0a46342
pkgrel=1
pkgdesc="algorithmic trading program for Warframe Market"
arch=("x86_64")
url="https://github.com/Kenya-DK/quantframe-react"
license=("GPL-3.0-only")
depends=(
	'webkit2gtk-4.1'		# tauri runtime
	'appmenu-gtk-module'	# global menu support
	'libappindicator-gtk3'	# tray support
	# already pulled in by 'webkit2gtk-4.1'
	#'gtk3' 'glib2' 'openssl' 'librsvg'
	'wget' 'curl' 'xdotool' 
)
makedepends=('git' 'nodejs' 'pnpm' 'rust' 'cargo' 'jq')
optdepends=()
options=(!lto)	# fix linking error (coming from ring)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}")
sha512sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	cd "${pkgname}"

	# disable the updater (does not work)
	#jq 'del(.plugins.updater)' src-tauri/tauri.conf.json > tmp.json
	#mv tmp.json src-tauri/tauri.conf.json

	# remove pubkey
	jq '.plugins.updater.pubkey = ""' src-tauri/tauri.conf.json > tmp.json
	mv tmp.json src-tauri/tauri.conf.json

	# deactivate other build targets
	jq '.bundle.active = false' src-tauri/tauri.conf.json > tmp.json
	mv tmp.json src-tauri/tauri.conf.json
}
build() {
	cd "${pkgname}"

	pnpm install
	pnpm tauri build
}
package() {
	cd "${pkgname}"
	outputDir="./src-tauri/target/release"
	iconsDir="src-tauri/icons"
	#install -Dm755 "./src-tauri/target/release/Quantframe" "${pkgdir}/usr/lib/quantframe/Quantframe"
	
	install -Dm755 ${srcdir}/../quantframe.sh "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${outputDir}/Quantframe" "${pkgdir}/usr/lib/${_pkgname}/Quantframe"

	# copy resources
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}/"
	cp -r "${outputDir}/resources" "${pkgdir}/usr/lib/${_pkgname}/"

	# icons
	install -Dm644 "${iconsDir}/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
	install -Dm644 "${iconsDir}/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
	install -Dm644 "${iconsDir}/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
