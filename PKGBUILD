# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=flomo-electron
pkgver=4.24.11
pkgrel=1
pkgdesc="浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://flomoapp.com/"
license=('private')
depends=(electron18 bash)
makedepends=(p7zip)
provides=(flomo)
conflicts=(flomo-pake)
source=("local://flomo-${pkgver}-x64.exe" $pkgname.desktop)
sha256sums=('b4ec448009bbe669168d38caf24844fd25908883da9ad8b24fdfeea3eb9d8c70'
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
exec electron18 /opt/$pkgname/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/flomo

	printf "icon\n"
	find $srcdir -name "logo-512.*.png" -path "*/app/img/*" -print -exec install -vDm644 {} $pkgdir/usr/share/pixmaps/flomo.png \;
	printf "different sized icons\n"
	for i in 16 24 32 48 64 128 256 512 1024; do
		install -vDm644 $srcdir/app/icons/${i}x${i}.png -t $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
	done

	printf "desktop\n"
	find $srcdir -name "*.desktop" -exec install -vDm644 {} -t $pkgdir/usr/share/applications/ \;
}
