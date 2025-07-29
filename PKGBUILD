# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=bodyslide
pkgver=5.7.1
pkgrel=2
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
source=("bsos::https://github.com/ousnius/BodySlide-and-Outfit-Studio/archive/refs/tags/v${pkgver}.tar.gz"
	'git+https://github.com/ousnius/nifly.git'
	'BodySlide.desktop'
	'OutfitStudio.desktop'
)
sha256sums=('b74a966efc5c174f0b9ee1b2cc47e331a729d26bf18cf4d0c9858c6bd6c242e6'
            'SKIP'
            '3a1491f4d63122061752cb7e365e9dc780fc2b6904d57fffd9c0bde3dcc1387a'
            'd64d0e1a432f75fefa1d6fe819c02c2285ae754f62e92dab8469e8616e9a12ab')


prepare() {
	tar xzvf bsos
	mv BodySlide-and-Outfit-Studio-${pkgver} ${pkgname}
	cp -rf nifly ${pkgname}/lib/
}

build() {
	cd ${pkgname}
	cmake . -B build -DCMAKE_BUILD_TYPE=Release
	make -j4 -C build
}

package() {
	install -Dm755 ${pkgname}/build/BodySlide ${pkgdir}/usr/bin/${pkgname}
	install -Dm755 ${pkgname}/build/OutfitStudio ${pkgdir}/usr/bin/outfitstudio
	install -Dm644 BodySlide.desktop ${pkgdir}/usr/share/applications/bodyslide.desktop
	install -Dm644 OutfitStudio.desktop ${pkgdir}/usr/share/applications/outfitstudio.desktop
	install -Dm777 ${pkgname}/Config.xml ${pkgdir}/usr/share/${pkgname}/Config.xml
        install -Dm777 ${pkgname}/BodySlide.xml ${pkgdir}/usr/share/${pkgname}/BodySlide.xml
        install -Dm777 ${pkgname}/OutfitStudio.xml ${pkgdir}/usr/share/${pkgname}/OutfitStudio.xml
	cp -r ${pkgname}/res ${pkgdir}/usr/share/${pkgname}/
	cp -r ${pkgname}/lang ${pkgdir}/usr/share/${pkgname}/
	pushd ${pkgdir}/usr/share/
	ln -s ${pkgname} outfitstudio
	chmod 777 ${pkgname}
	popd

	install -Dm644 ${pkgname}/res/images/BodySlide.png ${pkgdir}/usr/share/icons/HighContrast/256x256/apps/BodySlide.png
	install -Dm644 ${pkgname}/res/images/OutfitStudio.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/OutfitStudio.png
	install -Dm644 ${pkgname}/assets/BodySlide.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/BodySlide.svg
}
