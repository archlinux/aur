# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=z-library-electron
pkgver=2.0.0
pkgrel=1
pkgdesc="Stay connected to our library! use system electron"
arch=(x86_64 aarch64)
url="https://go-to-zlibrary.se/#desktop_app_tab"
license=('unknown')
makedepends=(asar)
depends=(electron bash hicolor-icon-theme)
source=("https://s3proxy.cdn-zlib.se/te_public_files/soft/linux/zlibrary-setup-latest.deb")
sha256sums=('d3d6c845fafd3a16bd1cb28451bfa8295767c6942fb0449930ee51db54b94c7f')

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
exec electron /opt/Z-Library/resources/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/z-library
	find $pkgdir -name "*.desktop" -print -exec sed -i "s/^Exec=.*/Exec=z-library/g" {} \;
	find $pkgdir -type d -empty -delete
}
