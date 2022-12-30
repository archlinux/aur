# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=ryusak
pkgver=1.6.1
_electron=electron
pkgrel=1
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=('any')
url="https://github.com/Ecks1337/RyuSAK"
license=('GPL3')
depends=("${_electron}")
makedepends=('nodejs' 'npm' 'imagemagick' 'jq' 'moreutils' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ecks1337/RyuSAK/archive/refs/tags/v${pkgver}.tar.gz"
"${pkgname}.sh"
"${pkgname}.desktop"
)
sha256sums=('654cc0663b531cf27d4132e3aeaeef595674e1b8528c3c1c7124425ddb7e1bab'
            'a77f6380eb5a6a24b332c4547fc3b6417259ce31481ed5ae3981731efc3fe86e'
            'c3606d69fe492931c2ee96cd98e289d3dc7300bcd5ed41f4488d3264ef317e20')

prepare(){
	cd "$srcdir/RyuSAK-$pkgver"
	local electronDist="/usr/lib/${_electron}"
	local electronVersion="$(< $electronDist/version)"
	jq ".devDependencies.electron = \"$electronVersion\"" package.json | sponge package.json
	jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
	jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json
	jq 'del(.devDependencies."macos-alias")' package.json | sponge package.json

	convert src/assets/icon.ico -thumbnail 128x128 -alpha on -background none -flatten ${pkgname}.png
	sed -i "s|_ELECTRON_|${_electron}|" $srcdir/${pkgname}.sh
}
build(){
	cd "$srcdir/RyuSAK-$pkgver"
	export HOME=$srcdir
	npm install
	npm run build
}

package() {
	cd "$srcdir/RyuSAK-$pkgver"/out/RyuSAK-*/resources/
	install -d ${pkgdir}/usr/share/${pkgname}
	cp -rf app/{.webpack,package.json} ${pkgdir}/usr/share/${pkgname}

	install -Dm644 ${srcdir}/RyuSAK-$pkgver/${pkgname}.png -t ${pkgdir}/usr/share/icons/hicolor/128x128/apps
	install -Dm755 ${srcdir}/${pkgname}.sh  ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications

}
