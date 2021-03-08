# Maintainer: Plaunarome <plaunarome@protonmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ecwolf
pkgver=1.3.3
pkgrel=3
pkgdesc="Advanced source port for Wolfenstein 3D engine games"
arch=("x86_64")
url="https://maniacsvault.net/ecwolf/"
license=("GPL")
depends=("gtk2" "libjpeg-turbo" "sdl" "sdl_mixer")
makedepends=("cmake")
install=ecwolf.install
source=("https://maniacsvault.net/${pkgname}/files/${pkgname}/1.x/${pkgname}-${pkgver}-src.tar.xz"
	"net.maniacsvault.${pkgname}.desktop"
	"use_xdg.patch")
sha512sums=('9c28d728170273cb9eb12f05ae7735171730050df684039b76b361435ec93b4ba71b2cd933cbcbcda6df61ad511549adc4b9a7c66fb1df1cc79634f0048f7123'
            '97c225f4a4aab1c14062ac3fc0a6598ac72608d5b2e84c143f8a7085013ea4716a4e6e9f2f8b65bd942ce53670ddeca4fee695bcb80863ded59a34bdfa7e76f6'
            '6bac3ed67c70263078797ab166344c72a9ffe6de3aa636aa578a58ddd9811bdde119db59dec3c1bb7d8644cce3e19744d7f384459acf8b346301beddbf7fc9d9')

prepare() {
	patch --directory "${pkgname}-${pkgver}-src" --strip 1 < use_xdg.patch
}

build() {
	cmake \
		-S "${pkgname}-${pkgver}-src" \
		-B build \
		-DBUILD_PATCHUTIL=ON \
		-DGPL=ON \
		-Wno-dev

	make --directory build
}

package() {
	install -D --mode 644 -- "net.maniacsvault.${pkgname}.desktop" "${pkgdir}/usr/share/applications/net.maniacsvault.${pkgname}.desktop"

	cd -- "${pkgname}-${pkgver}-src"
	install -D --mode 644 -- android-libs/launcher/res/drawable-xhdpi/ic_launcher.png "${pkgdir}/usr/share/pixmaps/ecwolf.png"
	install -D --mode 644 -- README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	cd ../build
	install -D --mode 755 -- "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
	install -D --mode 755 -- tools/patchutil/patchutil "${pkgdir}/usr/bin/${pkgname}-patchutil"
	install -D --mode 644 -- "${pkgname}.pk3" "${pkgdir}/usr/share/${pkgname}/${pkgname}.pk3"
}
