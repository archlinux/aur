# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=newitemmonitor
pkgver=1.0.3
pkgrel=2
pkgdesc="通用型上新监控器，上新时获得通知"
arch=(x86_64 aarch64)
url="https://fatecore.com/p/nim/"
license=('private')
depends=(electron4 bash glibc gcc-libs)
makedepends=(asar npm)
source=("http://resource.fatecore.com/nim/nim-v${pkgver}-win.zip"
	$pkgname.desktop
)
sha256sums=('37aa6933e5583833448f9e9410f54d39b27b55de0e5ef4969b6047eb692c5128'
            '11045c5d88008a723ec411feb12abb267bb9c39687797a0697aed0db8f8905c3')

prepare() {
	bsdtar -xvpf *.exe resources
	pushd resources
	asar e app.asar ./app
	pushd app
	printf ';exports.vip_source_limit = Infinity;' >>./scsdef.js
	printf ';exports.isVIP = () => true;exports.getVipLeftDays = () => 999;' >>./sk_electron_common/scs/libscs.js
	npm i sqlite3@5.0.2
	rm -rf node_modules/{node-gyp,@types}
	find . -type f -path "*/node_modules/*/bin/*" -print -delete
	find . -type l -path "*/.bin/*" -delete
	find . -type f -name "*.d.ts" -delete
	find . -type f -name "*.py" -delete
	find . -type f -name "Dockerfile" -delete
	find . -type f -name "cli.js" -delete
	find . -type f -path "*/man/man1/*" -delete
	find . -type f -name "bin.js" -delete
	find . -type f -name "build.js" -delete
	find . -type d -empty -delete
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av resources/app $pkgdir/opt/$pkgname/
	printf "#!/bin/sh
exec electron4 /opt/$pkgname/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname
	find $pkgdir -name "icon.png" -type f -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;
	install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
}
