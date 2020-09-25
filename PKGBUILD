# Maintainer: oakszyjrnrdy <oakszyjrnrdy at outlook dot com>

_pkgname="dmenu"
pkgname="$_pkgname-oakszyjrnrdy"
pkgver=5.0
pkgrel=2
pkgdesc="Generic menu for X built by oakszyjrnrdy"
url="https://tools.suckless.org/dmenu/"
arch=("x86_64")
license=("MIT")
depends=("sh" "glibc" "coreutils" "libx11" "libxinerama" "libxft" "freetype2" "fontconfig" "libfontconfig.so")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz"
	"dmenu-set_font-5.0.diff"
	"https://tools.suckless.org/dmenu/patches/fuzzymatch/dmenu-fuzzymatch-4.9.diff"
	"https://tools.suckless.org/dmenu/patches/fuzzyhighlight/dmenu-fuzzyhighlight-4.9.diff"
)
sha512sums=(
	"2b6a7cdf5aefc5e7ca7a4944883c3c16ee6f5005d2a96b61482d4899ad395f9cb8926907681d88b9df3e1188cf421dad4cc17e343b752f6cb8b161d33384b3f3"
	"665b6cd651b84ae6c4ad953100da409fa4b0b89c48342b061c62b55391bc4ca0f7ba17c518408e78c9064ad816e816bd38e5d861fa2bddc0ec6f8a92bf50e702"
	"6ce4ce0ddb9c1058f253ce46cdae8949c468d97ce7d787831d8a4f4ebd4db672761e2552703f58d36d01b2933dea624a30627629027b9a5960b404542a40a732"
	"ce806c6481b20d5b2352fc387816878c75285162f6404b3a969a95f9dbd6c7476fd4c6571f260886fa30ccc40e4a388ea8f6902e40ff90447e04bec3faf0669d"
)

prepare() {
	cd "${_pkgname}-${pkgver}"
	echo "CPPFLAGS+=${CPPFLAGS}" >> config.mk
	echo "CFLAGS+=${CFLAGS}" >> config.mk
	echo "LDFLAGS+=${LDFLAGS}" >> config.mk
	patch --strip=1 --input=../dmenu-set_font-5.0.diff
	patch --strip=1 --input=../dmenu-fuzzymatch-4.9.diff
	patch --strip=1 --input=../dmenu-fuzzyhighlight-4.9.diff
}

build() {
	cd "${_pkgname}-${pkgver}"
	make X11INC="/usr/include/X11" X11LIB="/usr/lib/X11"
}

package() {
	cd "${_pkgname}-${pkgver}"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
