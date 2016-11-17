# Maintainer: K900 <me@0upti.me>
# Patch by notfound4 <https://github.com/notfound4/Duelyst-Launcher>
pkgname="duelyst"
pkgver="1.76.0"
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
	"LICENSE.html::https://duelyst.com/tos"
	"duelyst_linux.diff"
	"duelyst.sh"
	"duelyst.desktop"
)

sha512sums=(
	"78c6f531eae9e820a8538ffc7c97ef12ce69b0b9a4f8e7e58acbf7be4f1459215708f9bf447b454f6836a7990fd75c1a20b5ebe07398ed80fc19ef0dd13ac0e1"
	"9bb012e75b0702d3321c9677921014932500549b9cbff1cc3f9698987c1b22ba804cb094fe498050e2300681cab4639b6818a05241ce3425704c60bb0a2f57ca"
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
