pkgname=youtube-dl-gui
_pkgname=youtube-dl-gui
pkgver=2.5.7
pkgrel=1
pkgdesc='[StefanLobbenmeier/youtube-dl-gui] A cross-platform GUI for youtube-dl made in Electron and node.js'
arch=('x86_64')
license=('AGPL3')
depends=('python-mutagen')
makedepends=('git' 'nodejs' 'npm')
url="https://github.com/StefanLobbenmeier/youtube-dl-gui"
options=('!strip')
source=("https://github.com/StefanLobbenmeier/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "Square150x150Logo.png::https://raw.githubusercontent.com/StefanLobbenmeier/${pkgname}/master/build/appx/Square150x150Logo.png"
        "Square44x44Logo.png::https://raw.githubusercontent.com/StefanLobbenmeier/${pkgname}/master/build/appx/Square44x44Logo.png"
        "StoreLogo.png::https://raw.githubusercontent.com/StefanLobbenmeier/${pkgname}/master/build/appx/StoreLogo.png")
md5sums=('3be7b8b182ccd96e48989b4e57311193'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}
	npm install
}

build() {
	cd ${pkgname}-${pkgver}
	npx electron-builder --linux tar.xz --config ../../electron-builder.yml
}

package() {
	mkdir -p ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/bin

	tar -xf ${srcdir}/${pkgname}-${pkgver}/dist/${pkgname}-${pkgver}.tar.xz -C $pkgdir/opt
	mv ${pkgdir}/opt/${pkgname}-${pkgver} ${pkgdir}/opt/${pkgname}
	install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/renderer/img/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"

	# Install appx icons at standard Linux icon sizes
	install -Dm644 "${srcdir}/Square44x44Logo.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
	install -Dm644 "${srcdir}/StoreLogo.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
	install -Dm644 "${srcdir}/Square150x150Logo.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

	ln -fs /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
