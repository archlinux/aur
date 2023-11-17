# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=z-library-electron
pkgver=1.0.2
pkgrel=1
pkgdesc="Stay connected to our library! use system electron"
arch=(x86_64 aarch64)
url="https://go-to-zlibrary.se/#desktop_app_tab"
license=('unknown')
makedepends=(asar)
depends=(electron bash hicolor-icon-theme)
source=("https://go-to-zlibrary.se/soft/zlibrary-setup-latest.deb"
)
sha256sums=('7fbdcefcea789dea4e2cde07593fdfa2c35626e94d03e017047ee96f597fefe3')

package() {
	bsdtar -xf data.tar.* -C $pkgdir

	find $pkgdir -name "resources" -type d -print \
		-exec asar e {}/app.asar {}/app \; \
		-exec rm -v {}/app.asar \;

	find "$pkgdir/opt/Z-Library/resources/app" \( -name "winx64" -or -name "macOSx86_64" \) -type d -print -exec rm -rv {} \; || true # why there is a tor.exe ??

	find $pkgdir/opt -not -path "*/resources/*" -type f -print -delete # saves 200M space

	pushd $pkgdir/opt/Z-Library/resources/app

	ln -sf dist public # fix a path bug

	popd

	printf "#!/bin/bash
exec electron /opt/Z-Library/resources/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/z-library
	find $pkgdir -name "*.desktop" -print -exec sed -i "s/^Exec=.*/Exec=$pkgname/g" {} \;
}
