# Maintainer: Robosky <fangyuhao0612 at gmail dot com>

pkgname=bilimini-git
_pkgname=bilimini
pkgver=v1.5.6.r2.g8622a72
pkgrel=1
pkgdesc="Hide!bilibili"
arch=('x86_64')
url="https://github.com/chitosai/${_pkgname}"
license=('custom')
makedepends=('git' 'npm' 'yarn')
depends=('electron11')
source=("${_pkgname}::git+${url}.git"
	"${_pkgname}.desktop"
	"${_pkgname}.sh")
sha256sums=('SKIP'
	'efeaac1a7ac1f9d6a12ca81e3e401df38a6f0c94e3ce995fd402c78accc5253b'
	'704ece204bc99a06eef8155f3262880654c6d20dec2cd712052ec4ed51029811')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	sed -i '/\"electron\"/d' package.json 
}

build() {
	cd "${srcdir}/${_pkgname}"
	
	export npm_config_target=$(tail /usr/lib/electron11/version)
	export npm_config_arch=x64
	export npm_config_target_arch=x64
	export npm_config_disturl=https://electronjs.org/headers
	export npm_config_runtime=electron
	export npm_config_build_from_source=true
	
	HOME="${srcdir}/.electron-gyp" npm install

	_ver="$(</usr/lib/electron11/version)"
	yarn run electron-builder --linux --x64 --dir \
		-c.electronDist=/usr/lib/electron11 \
		-c.electronVersion="$_ver"
}

package() {
	cd "${srcdir}/${_pkgname}"
	
	install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
	cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${_pkgname}/"
	
	install -Dm644 build/icon256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
	
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	
	install -dm755 "${pkgdir}/usr/share/applications/"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
