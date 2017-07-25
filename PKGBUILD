# Maintainer: K900 <me@0upti.me>
# Patch by notfound4 <https://github.com/notfound4/Duelyst-Launcher>
pkgname="duelyst"
pkgver="1.87.6"
pkgrel=1

pkgdesc="A collectible card game played on a grid-like board"
url="https://duelyst.com/"
license=("custom")

arch=("any")

depends=("electron")
makedepends=("imagemagick")

# we don't have any ELF files
options=("!strip")

source=(
	"http://downloads.counterplay.co/duelyst/v${pkgver}/duelyst-v${pkgver}-win32-x64.zip"
	"LICENSE.html::https://www.bandainamcoent.com/terms/duelyst"
	"duelyst_linux.diff"
	"duelyst.sh"
	"duelyst.desktop"
)

sha512sums=(
    "5ae58be018b468140d5212a3aea1343e135c80dbda72fa53f48719b093a7309596eccc7b50f910157e409f0c69fe94afd96a75ac0bf91323a47767bcbc5cbd8c"
    "3376cc068a0407347dcff320d6ef1e59255c76ce0095b448eb4b7ddf2c9502afa5461b2853b9d6d01d43232cb72341be2c5edcff464c72ae3877631ae44c4201"
    "a12e18b4ea8d61ea9002cc030dac648632a238ff4d411d1f201ffcb25fbec4ef292db03bbda408cbb397ea8a5fe5c425ae219ddfcaa43f8eae78e4b547283bd1"
	"7999607a9aff7476c6dc2111e170bbcaa9d57c0c659afea27fa736e44904d5500047ecff6b1d3ff2dd2236dbd9c839732cb3da611d23df9861900417906e7261"
	"4e428fce62dd57246af69bbc824922037978e3832ca5f924ea39a2a4fddd053f83be11ca2ede57dc3a89a8ebbd4908d928ca75492ba770463e8cd843416db567"
)

prepare() {
	cd "${srcdir}/resources/app"
	patch -i "${srcdir}/duelyst_linux.diff" "desktop.js"
}

package() {
	mkdir -p "${pkgdir}/opt/duelyst"
	cd "${srcdir}/resources/app"

	# clear out some libs
	find -name "*.dylib" -delete
	find -name "*.dll" -delete

	# remove Steamworks libs
	rm steam/greenworks*

	install -Dm755 "${srcdir}/duelyst.sh" "${pkgdir}/usr/bin/duelyst"

	for size in 16 24 32 48 64 128 256 512 1024; do
		icon_dir="${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		mkdir -p "${icon_dir}"
		convert "icon.png" -resize "${size}x${size}" "${icon_dir}/duelyst.png"
	done

	install -Dm644 "${srcdir}/duelyst.desktop" "${pkgdir}/usr/share/applications/duelyst.desktop"

	install -Dm644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.html"

	cp -rv --no-preserve=ownership -- * "${pkgdir}/opt/duelyst"
}
