# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=bodyslide
_pkgname=BodySlide
pkgver=5.7.1
pkgrel=5
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

backup=("usr/share/${_pkgname}/Config.xml")
source=("git+https://github.com/ousnius/BodySlide-and-Outfit-Studio.git#tag=v${pkgver}"
	'git+https://github.com/ousnius/nifly.git'
	'BodySlide.desktop'
	'OutfitStudio.desktop'
)
sha256sums=('SKIP'
            'SKIP'
            '3b257e41b82ad9f596d1f7dabcf7eae2a258f042457e30f0a56fdd04d23f46df'
            'e3188b423ad7d4fdc4d44813a2390ae8da9f7075c3820b423456726ea6d2473e')


prepare() {
	ln -sr BodySlide-and-Outfit-Studio ${pkgname}
	ln -sf ${srcdir}/nifly/* ${pkgname}/lib/nifly
}

build() {
	cd ${pkgname}
	cmake . -B build -DCMAKE_BUILD_TYPE=Release
	make -j4 -C build
}

package() {
	install -Dm755 ${pkgname}/build/BodySlide ${pkgdir}/usr/bin/${_pkgname}
	install -Dm755 ${pkgname}/build/OutfitStudio ${pkgdir}/usr/bin/OutfitStudio
	install -Dm644 BodySlide.desktop ${pkgdir}/usr/share/applications/BodySlide.desktop
	install -Dm644 OutfitStudio.desktop ${pkgdir}/usr/share/applications/OutfitStudio.desktop
	install -Dm777 ${pkgname}/Config.xml ${pkgdir}/usr/share/${_pkgname}/Config.xml
        install -Dm777 ${pkgname}/BodySlide.xml ${pkgdir}/usr/share/${_pkgname}/BodySlide.xml
        install -Dm777 ${pkgname}/OutfitStudio.xml ${pkgdir}/usr/share/${_pkgname}/OutfitStudio.xml
	cp -r ${pkgname}/res ${pkgdir}/usr/share/${_pkgname}/
	cp -r ${pkgname}/lang ${pkgdir}/usr/share/${_pkgname}/
	pushd ${pkgdir}/usr/share/
	ln -s ${_pkgname} OutfitStudio
	ln -s /usr/bin/OutfitStudio OutfitStudio/OutfitStudio
	chmod 777 ${_pkgname}
	popd
#	install ${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/bodyslide/LICENSE
	install -Dm644 ${pkgname}/res/images/BodySlide.png ${pkgdir}/usr/share/icons/HighContrast/256x256/apps/BodySlide.png
	install -Dm644 ${pkgname}/res/images/OutfitStudio.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/OutfitStudio.png
	install -Dm644 ${pkgname}/assets/BodySlide.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/BodySlide.svg
}
