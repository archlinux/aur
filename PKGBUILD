# Maintainer: Damglador <damglador@gmail.com>

pkgname=photocrea
_pkgname=photocrea

pkgver=2.3.8
pkgrel=1
arch=('any')

pkgdesc="Electron wrapper for Photopea"
url="https://github.com/vikdevelop/photopea_app"
license=("MIT")

depends=("electron")
makedepends=("npm" "desktop-file-utils")
provides=("$_pkgname" "photopea")
conflicts=("$_pkgname")

source=(
	"${_pkgname}::git+${url}#commit=230d3b11bd397d13cf330733e8574f696fdbd1bf" # tag 2.3.8
	"${_pkgname}.sh"
	)
sha256sums=(
	"b4191b1769baab51bd91f5f8c2f6f72ad6c7c8c6fe30c7cd005447aeba5b6001"
	"e99f64521f48c030b31e36f2216d018c6032500cc37a7598f153620072ad20c1"
	)

build(){
	cd ${_pkgname}
	npm pkg set "name=${_pkgname}"
	npm install --omit=dev
	rmdir node_modules/* --ignore-fail-on-non-empty
	rm src/preload.js
	desktop-file-edit \
	    --set-key=Exec \
		--set-value="${_pkgname}" \
		--set-icon="${_pkgname}" \
		com.github.vikdevelop.photopea_app.desktop
}

package(){
	install -Dm755 "${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
	cd ${_pkgname}
	install -Dm644 data/icons/com.github.vikdevelop.photopea_app.png \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
	install -Dm644 data/com.github.vikdevelop.photopea_app.metainfo.xml \
		"$pkgdir/usr/share/metainfo/${_pkgname}.metainfo.xml"
	install -Dm644 com.github.vikdevelop.photopea_app.desktop \
		"$pkgdir/usr/share/applications/${_pkgname}.desktop"
	install -d "$pkgdir/usr/lib/${_pkgname}/"
	cp -r --preserve=mode node_modules/ "$pkgdir/usr/lib/${_pkgname}/"
	cp -r --preserve=mode src/			"$pkgdir/usr/lib/${_pkgname}/"
	install -Dm644 package.json		-t 	"$pkgdir/usr/lib/${_pkgname}/"
	install -Dm644 LICENSE 			-t 	"$pkgdir/usr/share/licenses/${_pkgname}/"
}
