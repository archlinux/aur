# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=flomo-electron
pkgver=5.24.81
pkgrel=1
pkgdesc="浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('any')
url="https://flomoapp.com/"
license=('LicenseRef-custom')
depends=(electron20 bash hicolor-icon-theme)
makedepends=(p7zip)
provides=(flomo)
conflicts=(flomo-pake)
source=("local://flomo-${pkgver}.exe" $pkgname.desktop)
sha256sums=('ddfacd31139e85919fc539bee61c549ada30683bd1fefd89c39dab0e9456f7de'
            'ad1d9d71bd7f6765f1caef32532e233def9e09632262b3cfbc909e042b6961ef')

prepare() {
	7z x *.exe
	find . -name "app-64.7z" -print -exec 7z x {} \;
	find . -name "app.asar" -print -exec asar e {} ./app \;
	find . \( -name "*.map" -or -name "*.gz" \) -print -delete
}

package() {
	install -vd $pkgdir/opt/$pkgname
	cp -av $srcdir/app $pkgdir/opt/$pkgname

	printf "desktop file\n"

	printf "#!/bin/sh
exec electron20 /opt/$pkgname/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/flomo

	printf "icon\n"
	find $srcdir -name "logo-512.*.png" -path "*/app/img/*" -print -exec install -vDm644 {} $pkgdir/usr/share/pixmaps/flomo.png \;
	printf "different sized icons\n"
	for i in 16 24 32 48 64 128 256 512 1024; do
		install -vDm644 $srcdir/app/icons/${i}x${i}.png -t $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
	done

	printf "desktop\n"
	find $srcdir -name "*.desktop" -exec install -vDm644 {} -t $pkgdir/usr/share/applications/ \;
	find $pkgdir -path "*/node_modules/*/bin/*" -printf "rm %p\n" -type f -delete
	find $pkgdir \( -name "cli.js" -or -name "bin.js" \) -path "*/node_modules/*" -printf "rm %p\n" -type f -delete
	find $pkgdir -type d -empty -delete
}
