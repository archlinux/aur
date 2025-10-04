pkgname=youtube-dl-gui
_pkgname=youtube-dl-gui
pkgver=2.5.6
pkgrel=1
pkgdesc='[StefanLobbenmeier/youtube-dl-gui] A cross-platform GUI for youtube-dl made in Electron and node.js'
arch=('x86_64')
license=('AGPL3')
depends=('python-mutagen')
makedepends=('git' 'nodejs' 'npm')
url="https://github.com/StefanLobbenmeier/youtube-dl-gui"
options=('!strip')
source=("https://github.com/StefanLobbenmeier/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('81482a3bc653e85398463bf3c075199d')

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
	ln -fs /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
