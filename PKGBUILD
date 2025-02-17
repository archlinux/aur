# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=steam-monitor
pkgver=1.0.6
pkgrel=1
pkgdesc="Steam 游戏销量估算与价格、销量监控与历史记录"
arch=(x86_64 aarch64)
url="https://fatecore.com/p/steam-monitor/"
license=('custom:commercial')
depends=(electron6-bin bash glibc libx11)
makedepends=(asar)
provides=($pkgname)
source=("local://steamMonitor-installer.zip"
	$pkgname.desktop)
sha256sums=('e05f6c83ee1c36a1da3f4baf935f019ddc2a2acbf68788e11e6880ff1daf0968'
            '5b61ebefaa969ec30929fadc5f90be489154f87ee6f265ee83aca4ef977d4941')
options=(!strip)

prepare() {
	bsdtar -xf *.exe
	asar e ./**/app.asar ./app
	rm -rv app/node_modules/typescript
	rm -rv app/node_modules/**/bin/
	rm -rv app/node_modules/**/cli.js
	rm -rv app/node_modules/**/scripts/
	rm -rv app/node_modules/**/{bin,build}.js || true
	rm -v ./**/*.exe
}

package() {
	install -vd $pkgdir/opt/$pkgname/
	cp -av $srcdir/app $pkgdir/opt/$pkgname/
	find . -name "icon.png" -print -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;
	install -vDm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
	printf "#!/bin/bash
exec electron6 /opt/$pkgname/app \"\$@\"
" | install -vDm755 /dev/stdin $pkgdir/usr/bin/$pkgname
}
