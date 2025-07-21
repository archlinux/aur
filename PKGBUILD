# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=z-library-electron
pkgver=2.4.3
pkgrel=1
pkgdesc="Your gateway to knowledge and culture. use system electron"
arch=(x86_64 aarch64)
url="https://articles.sk/"
license=('unknown')
makedepends=(asar)
depends=(electron34 bash hicolor-icon-theme)
source=("https://s3proxy.cdn-zlib.sk/te_public_files/soft/linux/zlibrary-setup-latest.deb")
sha256sums=('3b2c0625d554006c4af82d786a46cbce192dff9404ebe95c84f1ed7a4b0e2cb6')
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
exec env ELECTRON_ENABLE_LOGGING=1 electron34 /opt/Z-Library/resources/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/z-library
	find $pkgdir -name "*.desktop" -print -exec sed -i "s/^Exec=.*/Exec=z-library/g" {} \;
}
