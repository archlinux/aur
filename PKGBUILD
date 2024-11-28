# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=z-library-electron
pkgver=2.3.0
pkgrel=1
pkgdesc="Your gateway to knowledge and culture. use system electron"
arch=(x86_64 aarch64)
url="https://singlelogin.re"
license=('unknown')
makedepends=(asar)
# Chrome/112.0.5615.204 Electron/24.8.8
depends=(electron bash hicolor-icon-theme)
source=("https://articles.sk/soft/linux/zlibrary-setup-latest.deb")
sha256sums=('a2de6205e37ad8a50e61ad792c06549646cfe570fa1715058dd14cb178262c6f')
options=(!emptydirs)

package() {
	bsdtar -xf data.tar.* -C $pkgdir

	find $pkgdir -name "resources" -type d -print \
		-exec asar e {}/app.asar {}/app \; \
		-exec rm -v {}/app.asar \;

	find "$pkgdir/opt/Z-Library/resources/app" \( -name "winx64" -or -name "macOSx86_64" \) -type d -print -exec rm -rv {} \; || true # why there is a tor.exe ??

	find $pkgdir/opt -not -path "*/resources/*" -type f -print -delete # saves 200M space

	find $pkgdir -name "cli.js" -print -delete

	find $pkgdir/ -path "*/node_modules/*/bin/*" -type f -print -delete

	pushd $pkgdir/opt/Z-Library/resources/app

	ln -sf dist public # fix a path bug

	popd

	printf "#!/bin/sh
exec env ELECTRON_ENABLE_LOGGING=1 electron /opt/Z-Library/resources/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/z-library
	find $pkgdir -name "*.desktop" -print -exec sed -i "s/^Exec=.*/Exec=z-library/g" {} \;
}
