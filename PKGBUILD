# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=z-library
pkgver=1.0.2
pkgrel=1
pkgdesc="Stay connected to our library!"
arch=(x86_64)
url="https://go-to-zlibrary.se/#desktop_app_tab"
license=('unknown')
makedepends=(asar)
depends=(electron24 bash hicolor-icon-theme)
source=("https://go-to-zlibrary.se/soft/zlibrary-setup-latest.deb"
)
sha256sums=('7fbdcefcea789dea4e2cde07593fdfa2c35626e94d03e017047ee96f597fefe3')

package() {
	bsdtar -xf data.tar.* -C $pkgdir

	find $pkgdir -name "resources" -type d -print \
		-exec asar e {}/app.asar {}/app \; \
		-exec rm {}/app.asar \;

	find "$pkgdir/opt/Z-Library/resources/app" -name "tor" -path "*/dist/*" -type d -print -exec rm -r {} \; || true # why there is a tor.exe ??

	find $pkgdir/opt -not -path "*/resources/*" -type f -print -delete # saves 200M space

	pushd $pkgdir/opt/Z-Library/resources/app

	cp -a dist public # fix a path bug

	popd

	printf "#!/bin/bash
electron24 /opt/Z-Library/resources/app
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/z-library
	find $pkgdir -name "*.desktop" -print -exec sed -i "s/^Exec=.*/Exec=$pkgname/g" {} \;
}
