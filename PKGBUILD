# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=bodyslide
_pkgname=BodySlide
pkgver=5.8.1
pkgrel=1
pkgdesc='BodySlide and Outfit Studio, a tool to convert, create, and customize outfits and bodies for Bethesda games.'
arch=('x86_64')

url="https://github.com/ousnius/BodySlide-and-Outfit-Studio"
license=('GPL-3.0-only')
keywords=('bethesda')
depends=('wxwidgets-gtk3'
	'glew'
)
makedepends=('cmake'
	'git'
	'gcc'
	'directx-headers'
	'fbx-sdk'
)
optdepends=('libxml2-legacy: for autodesk fbx')

backup=("opt/${_pkgname}/Config.xml")
source=("git+https://github.com/ousnius/BodySlide-and-Outfit-Studio.git#tag=v${pkgver}"
	'git+https://github.com/ousnius/nifly.git'
	'BodySlide.desktop'
	'OutfitStudio.desktop'
)
sha256sums=('SKIP'
            'SKIP'
            '2a49e0a776e835859933049cac7b2510374486df7e95535200f6d13f5eb48d55'
            '4f7089a49204d8587284ba40ed78dd50512dd4345a7a421310481ed63ce40ada')

prepare() {
	ln -srf BodySlide-and-Outfit-Studio ${pkgname}
	ln -sf ${srcdir}/nifly/* ${pkgname}/lib/nifly
	sed -i '139d' ${pkgname}/src/ui/WeightCopyDialog.cpp
}

build() {
	cd ${pkgname}
	cmake . -B build -DCMAKE_BUILD_TYPE=Release
	make -j4 -C build
}

package() {
	install -dm777 ${pkgdir}/opt/${_pkgname}
	install -Dm755 ${pkgname}/build/BodySlide ${pkgdir}/opt/${_pkgname}/BodySlide
	install -Dm755 ${pkgname}/build/OutfitStudio ${pkgdir}/opt/${_pkgname}/OutfitStudio
	install -Dm644 BodySlide.desktop ${pkgdir}/usr/share/applications/BodySlide.desktop
	install -Dm644 OutfitStudio.desktop ${pkgdir}/usr/share/applications/OutfitStudio.desktop
	install -Dm777 ${pkgname}/Config.xml ${pkgdir}/opt/${_pkgname}/Config.xml
        install -Dm777 ${pkgname}/BodySlide.xml ${pkgdir}/opt/${_pkgname}/BodySlide.xml
        install -Dm777 ${pkgname}/OutfitStudio.xml ${pkgdir}/opt/${_pkgname}/OutfitStudio.xml
	cp -r ${pkgname}/res ${pkgdir}/opt/${_pkgname}/
        cp -r ${pkgname}/lang ${pkgdir}/opt/${_pkgname}/

	install -Dm644 ${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/bodyslide/LICENSE
	install -Dm644 ${pkgname}/res/images/BodySlide.png ${pkgdir}/usr/share/icons/HighContrast/256x256/apps/BodySlide.png
	install -Dm644 ${pkgname}/res/images/OutfitStudio.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/OutfitStudio.png
	install -Dm644 ${pkgname}/assets/BodySlide.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/BodySlide.svg
}
