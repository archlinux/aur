# Maintainer: Your Name <youremail@domain.com>
pkgname=nook-desktop-electron-bin
pkgver=1.0.10
pkgrel=1
pkgdesc=" Desktop version of Nook, since Chrome MV3 will render it unusable "
arch=(any)
url="https://github.com/mn6/nook-desktop"
license=('unknown')
depends=(electron bash)
makedepends=(asar)
provides=(nook)
conflicts=()
source=("https://github.com/mn6/nook-desktop/releases/download/v${pkgver}/nook-desktop-${pkgver}-x64.nsis.7z"
	${pkgname%-bin}.desktop
)
sha256sums=('cb157650d60b52bacaea2c31142a3303dfdbb43b1e61ccae40993713b2911397'
            '57c31e3d47a7615c8ebad5d277137be00469601e58aa29326d656a3c498ce815')

prepare() {
	asar e ./**/app.asar ./app
	find ./app -type f -path "*/node_modules/*/bin/*" -delete -printf "rm %p\n"
	find ./app -type f \( -name "bin.js" -or -name "cli.js" \) -path "*/node_modules/*" -delete -printf "rm %p\n"
	find . -type d -empty -delete
}

package() {
	find $srcdir -name "nook.png" -print -exec install -vDm644 {} -t $pkgdir/usr/share/pixmaps/ \;
	install -d $pkgdir/opt/$pkgname
	cp -a $srcdir/app $pkgdir/opt/$pkgname/

	printf "#!/bin/sh
exec electron /opt/$pkgname/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/nook

	install -vDm644 *.desktop -t $pkgdir/usr/share/applications/
}
